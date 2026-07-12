import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../config/brutal_theme.dart';
import '../../shared/widgets/brutal_widgets.dart';
import '../../shared/models/platform_item.dart';
import '../../shared/widgets/platform_selector_sheet.dart';
import '../../shared/widgets/manga_tab_bar.dart';
import '../../features/search/search_screen.dart';
import '../../features/repository/repository_screen.dart';
import '../../core/models/repository.dart';
import '../../core/utils/platform_detector.dart';
import 'providers/home_providers.dart';

/// 获取本地化的分类列表
List<String> getCategoryOptions(AppLocalizations l10n) {
  return [
    l10n.all,
    l10n.ai,
    l10n.privacy,
    l10n.networkCategory,
    l10n.media,
    l10n.social,
    l10n.reading,
    l10n.tools,
    l10n.games,
  ];
}

/// 分类到英文 key 的映射
const Map<int, String> categoryKeyMap = {
  0: 'ALL',
  1: 'AI',
  2: 'PRIVACY',
  3: 'NETWORK',
  4: 'MEDIA',
  5: 'SOCIAL',
  6: 'READING',
  7: 'TOOLS',
  8: 'GAMES',
};

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // 当前选中的平台，默认为全部
  PlatformItem _selectedPlatform = platformOptions.firstWhere((p) => p.id == 'all');
  // 当前选中的分类索引
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categoryOptions = getCategoryOptions(l10n);
    final categoryKey = categoryKeyMap[_selectedCategoryIndex] ?? 'ALL';
    final searchParams = SearchParams(
      category: categoryKey,
      platform: _selectedPlatform.id,
    );
    final paginationState = ref.watch(paginationProvider(searchParams));

    return Scaffold(
      backgroundColor: BrutalTheme.canvas,
      body: SafeArea(
        child: Column(
          children: [
            // 顶部标题栏
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
                  Expanded(
                    child: Text(
                      l10n.easyStore.toUpperCase(),
                      style: BrutalTheme.headingStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  // 平台选择按钮
                  GestureDetector(
                    onTap: () => _showPlatformSelector(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                          Icon(_selectedPlatform.icon, size: 18, color: BrutalTheme.white),
                          const SizedBox(width: 6),
                          Text(
                            _selectedPlatform.getDisplayName(l10n),
                            style: const TextStyle(
                              fontFamily: 'Arial Black',
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: BrutalTheme.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_drop_down, size: 18, color: BrutalTheme.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 搜索按钮
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SearchScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: BrutalTheme.white,
                        border: Border.all(color: BrutalTheme.ink, width: 2),
                      ),
                      child: const Icon(Icons.search, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            // 分类Tab栏
            MangaTabBar(
              categories: categoryOptions,
              initialIndex: _selectedCategoryIndex,
              onCategoryChanged: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
            // 内容区域
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.read(paginationProvider(searchParams).notifier).refresh();
                },
                color: BrutalTheme.ink,
                backgroundColor: BrutalTheme.canvas,
                child: _buildContentList(paginationState, searchParams, l10n),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentList(PaginationState state, SearchParams searchParams, AppLocalizations l10n) {
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
              const SizedBox(height: 8),
              Text(
                state.error!,
                style: BrutalTheme.metaStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              BrutalButton(
                onPressed: () => ref.read(paginationProvider(searchParams).notifier).refresh(),
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
          ref.read(paginationProvider(searchParams).notifier).loadMore();
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
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildMangaRepoItem(state.items[index], l10n),
          );
        },
      ),
    );
  }

  /// 显示平台选择弹窗
  Future<void> _showPlatformSelector(BuildContext context) async {
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

  /// Manga风格仓库列表项
  Widget _buildMangaRepoItem(Repository repo, AppLocalizations l10n) {
    return Builder(
      builder: (context) {
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
              // 主要内容区
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 应用图标（带框）
                    BrutalAppIcon(
                      imageUrl: repo.owner.avatarUrl,
                      size: 56,
                    ),
                    const SizedBox(width: 12),
                    // 应用信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 应用名称
                          Text(
                            repo.name.toUpperCase(),
                            style: BrutalTheme.subheadingStyle.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          // 作者
                          Text(
                            repo.owner.login,
                            style: BrutalTheme.metaStyle.copyWith(color: BrutalTheme.disabled),
                          ),
                          // 描述
                          if (repo.description != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              repo.description!,
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
              // 分割线
              Container(
                height: 2,
                color: BrutalTheme.ink.withValues(alpha: 0.15),
              ),
              // 底部元数据行
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    // 支持的平台图标
                    ..._buildPlatformIcons(repo),
                    const SizedBox(width: 8),
                    // 星标数
                    if (repo.stargazersCount != null) ...[
                      const Icon(Icons.star, size: 14, color: BrutalTheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        _formatNumber(repo.stargazersCount!),
                        style: BrutalTheme.metaStyle,
                      ),
                      const SizedBox(width: 12),
                    ],
                    // 语言标签
                    if (repo.language != null) ...[
                      BrutalTag(text: repo.language!, isSmall: true, backgroundColor: BrutalTheme.ink),
                      const SizedBox(width: 8),
                    ],
                    // 间距
                    const Spacer(),
                    // READ > 按钮
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
      },
    );
  }

  /// 构建平台图标+文字标签列表
  List<Widget> _buildPlatformIcons(Repository repo) {
    final platforms = PlatformDetector.detectPlatforms(
      topics: repo.topics,
      language: repo.language,
      name: repo.name,
      description: repo.description,
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
