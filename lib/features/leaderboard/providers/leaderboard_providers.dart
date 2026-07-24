import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/github_api.dart';
import '../../../core/models/repository.dart';

/// 排行榜类型
enum LeaderboardType { trending, newRelease, popular }

/// 排行榜参数
class LeaderboardParams {
  final LeaderboardType type;
  final String platform;

  const LeaderboardParams({
    required this.type,
    required this.platform,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaderboardParams &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          platform == other.platform;

  @override
  int get hashCode => type.hashCode ^ platform.hashCode;
}

/// 排行榜分页状态
class LeaderboardPaginationState {
  final List<Repository> items;
  final int currentPage;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const LeaderboardPaginationState({
    this.items = const [],
    this.currentPage = 1,
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  LeaderboardPaginationState copyWith({
    List<Repository>? items,
    int? currentPage,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return LeaderboardPaginationState(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }
}

/// 排行榜搜索关键词映射
String getLeaderboardQuery(LeaderboardType type, String platform) {
  final platformQuery = {
    'android': 'android',
    'ios': 'ios swift',
    'macos': 'macos swift',
    'windows': 'windows',
    'linux': 'linux',
    'all': '',
  }[platform] ?? '';

  switch (type) {
    case LeaderboardType.trending:
      // 趋势：最近活跃的项目（按更新时间排序）
      return platformQuery.isNotEmpty ? 'stars:>50 pushed:>=2024-01-01 $platformQuery' : 'stars:>50 pushed:>=2024-01-01';
    case LeaderboardType.newRelease:
      // 新发布：最近有新版本发布的项目
      return platformQuery.isNotEmpty ? 'pushed:>=2024-06-01 $platformQuery' : 'pushed:>=2024-06-01';
    case LeaderboardType.popular:
      // 热门：星标数最高的项目
      return platformQuery.isNotEmpty ? 'stars:>500 $platformQuery' : 'stars:>500';
  }
}

/// 排行榜排序方式
String getLeaderboardSort(LeaderboardType type) {
  switch (type) {
    case LeaderboardType.trending:
      return 'updated';  // 按更新时间排序
    case LeaderboardType.newRelease:
      return 'updated';  // 按更新时间排序
    case LeaderboardType.popular:
      return 'stars';    // 按星标数排序
  }
}

/// 排行榜分页 Notifier
class LeaderboardPaginationNotifier extends StateNotifier<LeaderboardPaginationState> {
  final GithubApi _api;
  final LeaderboardParams _params;

  LeaderboardPaginationNotifier(this._api, this._params) : super(const LeaderboardPaginationState()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final query = getLeaderboardQuery(_params.type, _params.platform);
      final sort = getLeaderboardSort(_params.type);
      final result = await _api.searchRepositories(
        query: query,
        sort: sort,
        page: 1,
        perPage: 20,
      );
      final items = _mapToRepositories(result.items ?? []);
      state = state.copyWith(
        items: items,
        currentPage: 1,
        isLoading: false,
        hasMore: items.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);
    try {
      final nextPage = state.currentPage + 1;
      final query = getLeaderboardQuery(_params.type, _params.platform);
      final sort = getLeaderboardSort(_params.type);
      final result = await _api.searchRepositories(
        query: query,
        sort: sort,
        page: nextPage,
        perPage: 20,
      );
      final newItems = _mapToRepositories(result.items ?? []);
      state = state.copyWith(
        items: [...state.items, ...newItems],
        currentPage: nextPage,
        isLoading: false,
        hasMore: newItems.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    state = const LeaderboardPaginationState();
    await loadInitial();
  }

  List<Repository> _mapToRepositories(List<dynamic> items) {
    return items
        .map((item) => Repository(
              id: item.id,
              name: item.name,
              fullName: item.fullName,
              description: item.description,
              stargazersCount: item.stargazersCount,
              forksCount: item.forksCount,
              language: item.language,
              topics: item.topics,
              owner: User(
                id: item.owner?.id ?? 0,
                login: item.owner?.login ?? item.fullName.split('/').first,
                avatarUrl: item.owner?.avatarUrl ?? '',
              ),
            ))
        .toList();
  }
}

/// 排行榜分页 Provider
final leaderboardProvider = StateNotifierProvider.family<LeaderboardPaginationNotifier, LeaderboardPaginationState, LeaderboardParams>((ref, params) {
  final api = ref.watch(githubApiProvider);
  return LeaderboardPaginationNotifier(api, params);
});
