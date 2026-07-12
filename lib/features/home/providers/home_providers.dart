import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/github_api.dart';
import '../../../core/models/repository.dart';

/// 分类到 GitHub 搜索关键词的映射
const Map<String, String> categoryTopicMap = {
  'ALL': 'app',
  'AI': 'ai machine-learning artificial-intelligence',
  'PRIVACY': 'privacy security vpn',
  'NETWORK': 'network vpn proxy',
  'MEDIA': 'media video audio player',
  'SOCIAL': 'social chat messenger',
  'READING': 'reader rss ebook',
  'TOOLS': 'tools utility productivity',
  'GAMES': 'game gaming',
};

/// 平台到搜索关键词的映射
const Map<String, String> platformTopicMap = {
  'android': 'android',
  'ios': 'ios swift',
  'macos': 'macos swift',
  'windows': 'windows',
  'linux': 'linux',
  'all': '',
};

/// 搜索参数类
class SearchParams {
  final String category;
  final String platform;

  const SearchParams({required this.category, required this.platform});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchParams &&
          runtimeType == other.runtimeType &&
          category == other.category &&
          platform == other.platform;

  @override
  int get hashCode => category.hashCode ^ platform.hashCode;
}

/// 分页状态
class PaginationState {
  final List<Repository> items;
  final int currentPage;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const PaginationState({
    this.items = const [],
    this.currentPage = 1,
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  PaginationState copyWith({
    List<Repository>? items,
    int? currentPage,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return PaginationState(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }
}

/// 分页搜索 Notifier
class PaginationNotifier extends StateNotifier<PaginationState> {
  final GithubApi _api;
  final SearchParams _params;

  PaginationNotifier(this._api, this._params) : super(const PaginationState()) {
    loadInitial();
  }

  String get _query {
    final categoryQuery = categoryTopicMap[_params.category] ?? 'app';
    final platformQuery = platformTopicMap[_params.platform] ?? '';
    return platformQuery.isNotEmpty ? '$categoryQuery $platformQuery' : categoryQuery;
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _api.searchRepositories(
        query: _query,
        sort: 'stars',
        page: 1,
        perPage: 30,
      );
      final items = _mapToRepositories(result.items ?? []);
      state = state.copyWith(
        items: items,
        currentPage: 1,
        isLoading: false,
        hasMore: items.length >= 30,
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
      final result = await _api.searchRepositories(
        query: _query,
        sort: 'stars',
        page: nextPage,
        perPage: 30,
      );
      final newItems = _mapToRepositories(result.items ?? []);
      state = state.copyWith(
        items: [...state.items, ...newItems],
        currentPage: nextPage,
        isLoading: false,
        hasMore: newItems.length >= 30,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    state = const PaginationState();
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

/// 分页搜索 Provider
final paginationProvider = StateNotifierProvider.family<PaginationNotifier, PaginationState, SearchParams>((ref, params) {
  final api = ref.watch(githubApiProvider);
  return PaginationNotifier(api, params);
});
