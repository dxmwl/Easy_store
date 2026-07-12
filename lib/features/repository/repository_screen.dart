import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';
import '../../shared/widgets/manga_container.dart';
import '../../shared/widgets/repo_header_card.dart';
import '../../shared/widgets/stats_grid.dart';
import '../../core/models/repository.dart';
import 'changelog_screen.dart';
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
                Text(
                  l10n.noReleases.toUpperCase(),
                  style: const TextStyle(
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
              _buildDownloadButton(l10n),
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
    final l10n = AppLocalizations.of(context)!;
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
                child: Row(
                  children: [
                    const Icon(Icons.tag, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.selectVersion.toUpperCase(),
                      style: const TextStyle(
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

    final l10n = AppLocalizations.of(context)!;
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
                child: Row(
                  children: [
                    const Icon(Icons.file_download, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.selectAsset.toUpperCase(),
                      style: const TextStyle(
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

  Widget _buildDownloadButton(AppLocalizations l10n) {
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
              hasAsset ? '${l10n.installLatest.toUpperCase()} ${_selectedAsset!.name}' : l10n.selectAssetFirst.toUpperCase(),
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
          l10n.issues.toUpperCase(),
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
        Expanded(child: _buildFeatureButton(l10n.security.toUpperCase(), Icons.security, () {})),
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
              Text(
                l10n.changelog.toUpperCase(),
                style: const TextStyle(
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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChangelogScreen(release: release),
                          ),
                        );
                      },
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
    final readmeAsync = ref.watch(readmeProvider((owner: widget.owner, repo: widget.repo)));
    
    return MangaContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                l10n.readme.toUpperCase(),
                style: const TextStyle(
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
                child: Text(
                  l10n.markdown.toUpperCase(),
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
          const SizedBox(height: 16),
          // 仓库基本信息
          _buildInfoRow(l10n.owner.toUpperCase(), repo.owner.login),
          _buildInfoRow(l10n.languageLabel.toUpperCase(), repo.language ?? '-'),
          _buildInfoRow('STARS', repo.stargazersCount != null ? '${repo.stargazersCount}' : '-'),
          _buildInfoRow('FORKS', repo.forksCount != null ? '${repo.forksCount}' : '-'),
          const SizedBox(height: 16),
          // README 内容
          readmeAsync.when(
            data: (readme) {
              if (readme.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: BrutalTheme.surface,
                    border: Border.all(color: BrutalTheme.ink, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      l10n.noReadmeAvailable.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 12,
                        color: BrutalTheme.disabled,
                      ),
                    ),
                  ),
                );
              }
              return ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 600),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: BrutalTheme.white,
                    border: Border.all(color: BrutalTheme.ink, width: 2),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: _buildReadmeMarkdown(readme, repo.defaultBranch ?? 'main'),
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(color: BrutalTheme.ink),
              ),
            ),
            error: (error, stack) => Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: BrutalTheme.surface,
                border: Border.all(color: BrutalTheme.primary, width: 2),
              ),
              child: Center(
                child: Text(
                  l10n.failedToLoadReadme.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 12,
                    color: BrutalTheme.primary,
                  ),
                ),
              ),
            ),
          ),
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

  Widget _buildReadmeMarkdown(String readme, String defaultBranch) {
    final baseUrl = 'https://raw.githubusercontent.com/${widget.owner}/${widget.repo}/$defaultBranch/';
    final processedReadme = _processReadmeUrls(readme, baseUrl);
    
    return MarkdownBody(
      data: processedReadme,
      selectable: true,
      extensionSet: md.ExtensionSet.gitHubFlavored,
      styleSheet: MarkdownStyleSheet(
        p: const TextStyle(
          fontFamily: 'Courier New',
          fontSize: 14,
          color: BrutalTheme.ink,
          height: 1.6,
        ),
        h1: const TextStyle(
          fontFamily: 'Arial Black',
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: BrutalTheme.ink,
        ),
        h2: const TextStyle(
          fontFamily: 'Arial Black',
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: BrutalTheme.ink,
        ),
        h3: const TextStyle(
          fontFamily: 'Arial Black',
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: BrutalTheme.ink,
        ),
        code: const TextStyle(
          fontFamily: 'Courier New',
          fontSize: 12,
          color: BrutalTheme.ink,
          backgroundColor: BrutalTheme.surface,
        ),
        codeblockDecoration: BoxDecoration(
          color: BrutalTheme.surface,
          border: Border.all(color: BrutalTheme.ink, width: 1),
        ),
        a: const TextStyle(
          fontFamily: 'Courier New',
          fontSize: 14,
          color: BrutalTheme.primary,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
        blockquote: const TextStyle(
          fontFamily: 'Courier New',
          fontSize: 14,
          color: BrutalTheme.disabled,
          fontStyle: FontStyle.italic,
        ),
        blockquoteDecoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: BrutalTheme.ink, width: 4),
          ),
        ),
        tableHead: const TextStyle(
          fontFamily: 'Arial Black',
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: BrutalTheme.ink,
        ),
        tableBody: const TextStyle(
          fontFamily: 'Courier New',
          fontSize: 12,
          color: BrutalTheme.ink,
        ),
      ),
    );
  }

  String _processReadmeUrls(String content, String baseUrl) {
    // 处理 Markdown 图片 ![alt](url)
    content = content.replaceAllMapped(
      RegExp(r'!\[([^\]]*)\]\(([^)]+)\)'),
      (match) {
        final alt = match.group(1);
        var url = match.group(2)!;
        
        if (!url.startsWith('http://') && !url.startsWith('https://')) {
          url = '$baseUrl$url';
        }
        
        return '![$alt]($url)';
      },
    );
    
    // 处理 HTML img 标签
    content = content.replaceAllMapped(
      RegExp(r'<img\s+[^>]*src="([^"]+)"[^>]*>', caseSensitive: false),
      (match) {
        var url = match.group(1)!;
        
        if (!url.startsWith('http://') && !url.startsWith('https://')) {
          url = '$baseUrl$url';
        }
        
        return '<img src="$url" />';
      },
    );
    
    return content;
  }
}
