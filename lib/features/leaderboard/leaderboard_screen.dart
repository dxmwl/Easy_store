import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';
import '../../shared/models/platform_item.dart';
import '../../shared/widgets/platform_selector_sheet.dart';
import '../../features/repository/repository_screen.dart';
import '../../core/models/repository.dart';
import 'providers/leaderboard_providers.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  int _selectedTabIndex = 0;
  PlatformItem _selectedPlatform = platformOptions.firstWhere((p) => p.id == 'all');

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(l10n),
            _buildTabBar(),
            Expanded(
              child: _buildContent(l10n),
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
          const Icon(Icons.leaderboard, size: 24),
          const SizedBox(width: 8),
          Text(
            l10n.leaderboard.toUpperCase(),
            style: BrutalTheme.headingStyle.copyWith(fontSize: 18),
          ),
          const Spacer(),
          // 平台选择按钮
          GestureDetector(
            onTap: () => _showPlatformSelector(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: BrutalTheme.primary,
                border: Border.all(color: BrutalTheme.ink, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: BrutalTheme.ink,
                    offset: Offset(3, 3),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_selectedPlatform.icon, size: 16, color: BrutalTheme.white),
                  const SizedBox(width: 4),
                  Text(
                    _selectedPlatform.getDisplayName(l10n),
                    style: const TextStyle(
                      fontFamily: 'Arial Black',
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: BrutalTheme.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down, size: 16, color: BrutalTheme.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    final l10n = AppLocalizations.of(context)!;
    final tabs = [l10n.trendingTab.toUpperCase(), l10n.newReleaseTab.toUpperCase(), l10n.popularTab.toUpperCase()];
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: BrutalTheme.canvas,
        border: Border(
          bottom: BorderSide(color: BrutalTheme.ink, width: 2),
        ),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedTabIndex == index;
          return Padding(
            padding: EdgeInsets.only(right: index < tabs.length - 1 ? 8 : 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? BrutalTheme.primary : BrutalTheme.white,
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontFamily: 'Arial Black',
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: isSelected ? BrutalTheme.white : BrutalTheme.ink,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildContent(AppLocalizations l10n) {
    final leaderboardType = LeaderboardType.values[_selectedTabIndex];
    final params = LeaderboardParams(
      type: leaderboardType,
      platform: _selectedPlatform.id,
    );
    final paginationState = ref.watch(leaderboardProvider(params));

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(leaderboardProvider(params).notifier).refresh();
      },
      color: BrutalTheme.ink,
      backgroundColor: BrutalTheme.canvas,
      child: _buildLeaderboardList(paginationState, params, l10n),
    );
  }

  Widget _buildLeaderboardList(LeaderboardPaginationState state, LeaderboardParams params, AppLocalizations l10n) {
    if (state.isLoading && state.items.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: BrutalTheme.ink),
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
                l10n.loadError.toUpperCase(),
                style: BrutalTheme.subheadingStyle,
              ),
              const SizedBox(height: 16),
              BrutalButton(
                onPressed: () => ref.read(leaderboardProvider(params).notifier).refresh(),
                child: Text(l10n.retry.toUpperCase()),
              ),
            ],
          ),
        ),
      );
    }

    if (state.items.isEmpty) {
      return Center(
        child: BrutalCard(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.search_off, size: 48, color: BrutalTheme.disabled),
              const SizedBox(height: 12),
              Text(
                l10n.noData.toUpperCase(),
                style: BrutalTheme.subheadingStyle,
              ),
            ],
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
          ref.read(leaderboardProvider(params).notifier).loadMore();
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
          final repo = state.items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildLeaderboardItem(repo, index + 1, l10n),
          );
        },
      ),
    );
  }

  Widget _buildLeaderboardItem(Repository repo, int rank, AppLocalizations l10n) {
    return BrutalCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RepositoryScreen(
              owner: repo.owner.login,
              repo: repo.name,
            ),
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
                // 排名
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: rank <= 3 ? BrutalTheme.primary : BrutalTheme.surface,
                    border: Border.all(color: BrutalTheme.ink, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '$rank',
                      style: TextStyle(
                        fontFamily: 'Arial Black',
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: rank <= 3 ? BrutalTheme.white : BrutalTheme.ink,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // 头像
                BrutalAppIcon(
                  imageUrl: repo.owner.avatarUrl,
                  size: 48,
                ),
                const SizedBox(width: 12),
                // 信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repo.name.toUpperCase(),
                        style: BrutalTheme.subheadingStyle.copyWith(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        repo.owner.login,
                        style: BrutalTheme.metaStyle.copyWith(color: BrutalTheme.disabled),
                      ),
                      if (repo.description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          repo.description!,
                          style: BrutalTheme.bodyStyle.copyWith(fontSize: 11),
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
                if (repo.stargazersCount != null) ...[
                  const Icon(Icons.star, size: 14, color: BrutalTheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    _formatNumber(repo.stargazersCount!),
                    style: BrutalTheme.metaStyle,
                  ),
                  const SizedBox(width: 12),
                ],
                if (repo.language != null) ...[
                  BrutalTag(text: repo.language!, isSmall: true, backgroundColor: BrutalTheme.ink),
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

  String _formatNumber(int number) {
    if (number >= 1000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number >= 1000) return '${(number / 1000).toStringAsFixed(1)}K';
    return number.toString();
  }

  void _showPlatformSelector(BuildContext context) async {
    final result = await PlatformSelectorSheet.show(
      context,
      currentSelection: _selectedPlatform,
    );
    if (result != null) {
      setState(() {
        _selectedPlatform = result;
      });
    }
  }
}
