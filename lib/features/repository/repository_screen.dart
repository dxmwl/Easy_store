import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';
import '../../shared/widgets/manga_container.dart';
import '../../shared/widgets/repo_header_card.dart';
import '../../shared/widgets/stats_grid.dart';
import '../../core/models/repository.dart';
import '../../core/models/release.dart';
import 'providers/repository_providers.dart';
import 'issues_screen.dart';

class RepositoryScreen extends ConsumerStatefulWidget {
  final String owner;
  final String repo;

  const RepositoryScreen({
    super.key,
    required this.owner,
    required this.repo,
  });

  @override
  ConsumerState<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends ConsumerState<RepositoryScreen> {
  int _selectedVersionTab = 0;
  Release? _selectedRelease;
  ReleaseAsset? _selectedAsset;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final repoAsync = ref.watch(repositoryProvider((owner: widget.owner, repo: widget.repo)));
    final releasesAsync = ref.watch(releasesProvider((owner: widget.owner, repo: widget.repo)));

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(l10n),
            Expanded(
              child: repoAsync.when(
                data: (repo) => _buildContent(repo, releasesAsync, l10n),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: BrutalTheme.ink),
                ),
                error: (error, stack) => _buildError(error, l10n),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: BrutalTheme.canvas,
        border: Border(
          bottom: BorderSide(color: BrutalTheme.ink, width: BrutalTheme.borderWidth),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BrutalTheme.white,
                border: Border.all(color: BrutalTheme.ink, width: 2),
              ),
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.repo.toUpperCase(),
              style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final url = Uri.parse('https://github.com/${widget.owner}/${widget.repo}');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: BrutalTheme.primary,
                border: Border.all(color: BrutalTheme.ink, width: 2),
              ),
              child: const Icon(Icons.open_in_new, size: 18, color: BrutalTheme.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Repository repo, AsyncValue<List<Release>> releasesAsync, AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RepoHeaderCard(repo: repo),
          const SizedBox(height: 24),
          _buildActionArea(releasesAsync, l10n),
          const SizedBox(height: 24),
          releasesAsync.when(
            data: (releases) {
              final totalDownloads = _calculateTotalDownloads(releases);
              return StatsGrid(
                forks: repo.forksCount,
                stars: repo.stargazersCount,
                issues: repo.openIssuesCount,
                downloads: totalDownloads,
                license: repo.license?.name,
                onIssuesTap: _navigateToIssues,
              );
            },
            loading: () => StatsGrid(
              forks: repo.forksCount,
              stars: repo.stargazersCount,
              issues: repo.openIssuesCount,
              downloads: null,
              license: repo.license?.name,
              onIssuesTap: _navigateToIssues,
            ),
            error: (_, __) => StatsGrid(
              forks: repo.forksCount,
              stars: repo.stargazersCount,
              issues: repo.openIssuesCount,
              downloads: null,
              license: repo.license?.name,
              onIssuesTap: _navigateToIssues,
            ),
          ),
          const SizedBox(height: 24),
          _buildFeatureButtons(l10n),
          const SizedBox(height: 24),
          _buildChangelog(releasesAsync, l10n),
          const SizedBox(height: 24),
          _buildReadme(repo, l10n),
        ],
      ),
    );
  }

  int _calculateTotalDownloads(List<Release> releases) {
    int total = 0;
    for (final release in releases) {
      if (release.assets != null) {
        for (final asset in release.assets!) {
          total += asset.downloadCount ?? 0;
        }
      }
    }
    return total;
  }

  void _navigateToIssues() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IssuesScreen(
          owner: widget.owner,
          repo: widget.repo,
        ),
      ),
    );
  }

  Widget _buildActionArea(AsyncValue<List<Release>> releasesAsync, AppLocalizations l10n) {
    return MangaContainer(
      child: releasesAsync.when(
        data: (releases) {
          final filteredReleases = _filterReleases(releases);
          
          if (filteredReleases.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVersionTabs(l10n),
                const SizedBox(height: 16),
                const Text(
                  'NO RELEASES AVAILABLE',
                  style: TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 12,
                    color: BrutalTheme.disabled,
                  ),
                ),
              ],
            );
          }

          // 默认选中第一个版本
          if (_selectedRelease == null || !filteredReleases.contains(_selectedRelease)) {
            _selectedRelease = filteredReleases.first;
            _selectedAsset = _selectedRelease!.assets?.isNotEmpty == true
                ? _selectedRelease!.assets!.first
                : null;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVersionTabs(l10n),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildVersionDropdown(filteredReleases),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildAssetDropdown(_selectedRelease?.assets ?? []),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildDownloadButton(),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => const Text('Error loading releases'),
      ),
    );
  }

  List<Release> _filterReleases(List<Release> releases) {
    switch (_selectedVersionTab) {
      case 0: // 稳定版
        return releases.where((r) => r.prerelease != true).toList();
      case 1: // 预览版
        return releases.where((r) => r.prerelease == true).toList();
      case 2: // 全部
      default:
        return releases;
    }
  }

  Widget _buildVersionTabs(AppLocalizations l10n) {
    final tabs = [l10n.stable, l10n.beta, 'ALL'];
    
    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = _selectedVersionTab == index;
        return Padding(
          padding: EdgeInsets.only(right: index < tabs.length - 1 ? 8 : 0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedVersionTab = index;
                _selectedRelease = null;
                _selectedAsset = null;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? BrutalTheme.primary : BrutalTheme.white,
                border: Border.all(color: Colors.black, width: 2.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(3, 3),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontFamily: 'Arial Black',
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildVersionDropdown(List<Release> releases) {
    return GestureDetector(
      onTap: () => _showVersionMenu(releases),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: BrutalTheme.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'VERSION',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: BrutalTheme.disabled,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _selectedRelease?.tagName ?? 'Select',
                    style: const TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.ink,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 20, color: BrutalTheme.ink),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetDropdown(List<ReleaseAsset> assets) {
    return GestureDetector(
      onTap: () => _showAssetMenu(assets),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: BrutalTheme.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ASSET',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: BrutalTheme.disabled,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _selectedAsset?.name ?? 'Select',
                    style: const TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.ink,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 20, color: BrutalTheme.ink),
          ],
        ),
      ),
    );
  }

  void _showVersionMenu(List<Release> releases) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        decoration: BoxDecoration(
          color: BrutalTheme.canvas,
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, -6),
              blurRadius: 0,
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.tag, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'SELECT VERSION',
                      style: TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: releases.length,
                  itemBuilder: (context, index) {
                    final release = releases[index];
                    final isSelected = release == _selectedRelease;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRelease = release;
                          _selectedAsset = release.assets?.isNotEmpty == true
                              ? release.assets!.first
                              : null;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? BrutalTheme.primary : BrutalTheme.canvas,
                          border: const Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            if (release.prerelease == true)
                              Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: BrutalTheme.ink,
                                  border: Border.all(color: Colors.black, width: 1),
                                ),
                                child: const Text(
                                  'BETA',
                                  style: TextStyle(
                                    fontFamily: 'Arial Black',
                                    fontSize: 8,
                                    color: BrutalTheme.white,
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    release.name ?? release.tagName,
                                    style: TextStyle(
                                      fontFamily: 'Arial Black',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                                    ),
                                  ),
                                  if (release.assets != null && release.assets!.isNotEmpty)
                                    Text(
                                      '${release.assets!.length} assets',
                                      style: TextStyle(
                                        fontFamily: 'Courier New',
                                        fontSize: 11,
                                        color: isSelected
                                            ? BrutalTheme.white.withValues(alpha: 0.7)
                                            : BrutalTheme.disabled,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              const Icon(Icons.check, color: BrutalTheme.white, size: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAssetMenu(List<ReleaseAsset> assets) {
    if (assets.isEmpty) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        decoration: BoxDecoration(
          color: BrutalTheme.canvas,
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, -6),
              blurRadius: 0,
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.file_download, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'SELECT ASSET',
                      style: TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    final asset = assets[index];
                    final isSelected = asset == _selectedAsset;
                    final sizeMB = asset.size != null
                        ? (asset.size! / 1024 / 1024).toStringAsFixed(1)
                        : '?';
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedAsset = asset);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? BrutalTheme.primary : BrutalTheme.canvas,
                          border: const Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    asset.name,
                                    style: TextStyle(
                                      fontFamily: 'Arial Black',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '$sizeMB MB',
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 11,
                                      color: isSelected
                                          ? BrutalTheme.white.withValues(alpha: 0.7)
                                          : BrutalTheme.disabled,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              const Icon(Icons.check, color: BrutalTheme.white, size: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadButton() {
    final hasAsset = _selectedAsset != null;
    
    return GestureDetector(
      onTap: hasAsset ? () => _downloadAsset() : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: hasAsset ? BrutalTheme.primary : BrutalTheme.disabled,
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: hasAsset
              ? const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.download, size: 20, color: BrutalTheme.white),
            const SizedBox(width: 8),
            Text(
              hasAsset ? 'INSTALL ${_selectedAsset!.name}' : 'SELECT ASSET FIRST',
              style: const TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.white,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _downloadAsset() async {
    if (_selectedAsset?.browserDownloadUrl != null) {
      final url = Uri.parse(_selectedAsset!.browserDownloadUrl!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    }
  }

  Widget _buildFeatureButtons(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(child: _buildFeatureButton(
          'ISSUES',
          Icons.bug_report,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => IssuesScreen(
                  owner: widget.owner,
                  repo: widget.repo,
                ),
              ),
            );
          },
        )),
        const SizedBox(width: 8),
        Expanded(child: _buildFeatureButton('SECURITY', Icons.security, () {})),
      ],
    );
  }

  Widget _buildFeatureButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: BrutalTheme.surface,
          border: Border.all(color: Colors.black, width: 2.5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 24, color: BrutalTheme.ink),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.ink,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangelog(AsyncValue<List<Release>> releasesAsync, AppLocalizations l10n) {
    return MangaContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'CHANGELOG',
                style: TextStyle(
                  fontFamily: 'Arial Black',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: BrutalTheme.ink,
                ),
              ),
              const SizedBox(width: 8),
              if (_selectedRelease != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: BrutalTheme.primary,
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: Text(
                    _selectedRelease!.tagName,
                    style: const TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.white,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          releasesAsync.when(
            data: (releases) {
              final release = _selectedRelease ?? (releases.isNotEmpty ? releases.first : null);
              if (release == null) {
                return const Text(
                  'No releases available',
                  style: TextStyle(color: BrutalTheme.disabled),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (release.body != null)
                    Text(
                      release.body!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Courier New',
                        fontSize: 13,
                        color: BrutalTheme.ink,
                        height: 1.5,
                      ),
                    ),
                  const SizedBox(height: 12),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                          color: BrutalTheme.ink,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: const Text(
                          'READ MORE ->',
                          style: TextStyle(
                            fontFamily: 'Arial Black',
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            color: BrutalTheme.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => const Text('Failed to load'),
          ),
        ],
      ),
    );
  }

  Widget _buildReadme(Repository repo, AppLocalizations l10n) {
    return MangaContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'ABOUT',
                style: TextStyle(
                  fontFamily: 'Arial Black',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: BrutalTheme.ink,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: BrutalTheme.ink,
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: const Text(
                  'en',
                  style: TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: BrutalTheme.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (repo.description != null)
            Text(
              repo.description!,
              style: const TextStyle(
                fontFamily: 'Courier New',
                fontSize: 14,
                color: BrutalTheme.ink,
                height: 1.5,
              ),
            ),
          const SizedBox(height: 16),
          _buildInfoRow('OWNER', repo.owner.login),
          _buildInfoRow('LANGUAGE', repo.language ?? '-'),
          _buildInfoRow('STARS', repo.stargazersCount != null ? '${repo.stargazersCount}' : '-'),
          _buildInfoRow('FORKS', repo.forksCount != null ? '${repo.forksCount}' : '-'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: BrutalTheme.disabled,
                letterSpacing: 0.3,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Arial Black',
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: BrutalTheme.ink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(Object error, AppLocalizations l10n) {
    return Center(
      child: MangaContainer(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: BrutalTheme.primary),
            const SizedBox(height: 12),
            Text(
              l10n.loadError.toUpperCase(),
              style: BrutalTheme.subheadingStyle,
            ),
            const SizedBox(height: 16),
            BrutalButton(
              onPressed: () => ref.invalidate(repositoryProvider((owner: widget.owner, repo: widget.repo))),
              child: Text(l10n.retry.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
