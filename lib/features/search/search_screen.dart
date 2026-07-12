import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';
import '../../features/repository/repository_screen.dart';
import '../../core/utils/platform_detector.dart';
import 'providers/search_providers.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final paginationState = ref.watch(searchPaginationProvider);

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
                    child: BrutalTextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      placeholder: l10n.searchRepos.toUpperCase(),
                      onChanged: (value) {
                        ref.read(searchQueryProvider.notifier).state = value;
                      },
                      onSubmitted: () {},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildSearchResults(paginationState, l10n),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(SearchPaginationState state, AppLocalizations l10n) {
    if (state.isLoading && state.items.isEmpty) {
      return Center(
        child: Text(
          l10n.typeToSearch.toUpperCase(),
          style: BrutalTheme.bodyStyle.copyWith(
            fontWeight: FontWeight.w900,
            color: BrutalTheme.disabled,
          ),
        ),
      );
    }

    if (state.error != null && state.items.isEmpty) {
      return Center(
        child: BrutalCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: BrutalTheme.primary),
              const SizedBox(height: 12),
              Text(
                l10n.searchFailed.toUpperCase(),
                style: BrutalTheme.subheadingStyle,
              ),
              const SizedBox(height: 16),
              BrutalButton(
                onPressed: () => ref.read(searchPaginationProvider.notifier).refresh(),
                child: Text(l10n.retry.toUpperCase()),
              ),
            ],
          ),
        ),
      );
    }

    if (state.items.isEmpty) {
      return Center(
        child: Text(
          l10n.typeToSearch.toUpperCase(),
          style: BrutalTheme.bodyStyle.copyWith(
            fontWeight: FontWeight.w900,
            color: BrutalTheme.disabled,
          ),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter < 200 &&
            !state.isLoading &&
            state.hasMore) {
          ref.read(searchPaginationProvider.notifier).loadMore();
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.items.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(color: BrutalTheme.ink),
              ),
            );
          }
          final item = state.items[index];
          final owner = item.fullName.split('/')[0];
          final name = item.fullName.split('/')[1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildMangaSearchItem(item, owner, name, l10n),
          );
        },
      ),
    );
  }

  Widget _buildMangaSearchItem(dynamic item, String owner, String name, AppLocalizations l10n) {
    return BrutalCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RepositoryScreen(owner: owner, repo: name),
          ),
        );
      },
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrutalAppIcon(
                  imageUrl: item.owner?.avatarUrl,
                  size: 56,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: BrutalTheme.subheadingStyle.copyWith(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        owner,
                        style: BrutalTheme.metaStyle.copyWith(color: BrutalTheme.disabled),
                      ),
                      if (item.description != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          item.description!,
                          style: BrutalTheme.bodyStyle.copyWith(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            color: BrutalTheme.ink.withValues(alpha: 0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                ..._buildPlatformIcons(item),
                const SizedBox(width: 8),
                if (item.stargazersCount != null) ...[
                  const Icon(Icons.star, size: 14, color: BrutalTheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    _formatNumber(item.stargazersCount!),
                    style: BrutalTheme.metaStyle,
                  ),
                  const SizedBox(width: 12),
                ],
                if (item.language != null) ...[
                  BrutalTag(text: item.language!, isSmall: true, backgroundColor: BrutalTheme.ink),
                  const SizedBox(width: 8),
                ],
                const Spacer(),
                Text(
                  l10n.readMore.toUpperCase(),
                  style: BrutalTheme.labelStyle.copyWith(
                    color: BrutalTheme.primary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPlatformIcons(dynamic item) {
    final platforms = PlatformDetector.detectPlatforms(
      topics: item.topics,
      language: item.language,
      name: item.name,
      description: item.description,
    );

    if (platforms.isEmpty) return [];

    return platforms.map((platform) {
      String label;
      IconData icon;
      Color bgColor;

      switch (platform) {
        case 'android':
          label = 'ANDROID';
          icon = Icons.android;
          bgColor = const Color(0xFF3DDC84);
          break;
        case 'ios':
          label = 'iOS';
          icon = Icons.phone_iphone;
          bgColor = BrutalTheme.ink;
          break;
        case 'macos':
          label = 'macOS';
          icon = Icons.laptop_mac;
          bgColor = BrutalTheme.ink;
          break;
        case 'windows':
          label = 'WINDOWS';
          icon = Icons.desktop_windows;
          bgColor = const Color(0xFF0078D4);
          break;
        case 'linux':
          label = 'LINUX';
          icon = Icons.computer;
          bgColor = const Color(0xFFDD4814);
          break;
        default:
          label = platform.toUpperCase();
          icon = Icons.help_outline;
          bgColor = BrutalTheme.disabled;
      }

      return Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: BrutalTheme.ink, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 10, color: BrutalTheme.white),
            const SizedBox(width: 3),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Arial Black',
                fontSize: 8,
                fontWeight: FontWeight.w900,
                color: BrutalTheme.white,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  String _formatNumber(int number) {
    if (number >= 1000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number >= 1000) return '${(number / 1000).toStringAsFixed(1)}K';
    return number.toString();
  }
}
