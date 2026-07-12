import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/github_api.dart';
import '../../../core/models/search_result.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

/// 搜索分页状态
class SearchPaginationState {
  final List<SearchItem> items;
  final int currentPage;
  final bool isLoading;
  final bool hasMore;
  final String? error;
  final int totalCount;

  const SearchPaginationState({
    this.items = const [],
    this.currentPage = 1,
    this.isLoading = false,
    this.hasMore = true,
    this.error,
    this.totalCount = 0,
  });

  SearchPaginationState copyWith({
    List<SearchItem>? items,
    int? currentPage,
    bool? isLoading,
    bool? hasMore,
    String? error,
    int? totalCount,
  }) {
    return SearchPaginationState(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}

/// 搜索分页 Notifier
class SearchPaginationNotifier extends StateNotifier<SearchPaginationState> {
  final GithubApi _api;
  String _query;

  SearchPaginationNotifier(this._api, this._query) : super(const SearchPaginationState()) {
    if (_query.isNotEmpty) {
      loadInitial();
    }
  }

  void updateQuery(String query) {
    _query = query;
    if (query.isNotEmpty) {
      refresh();
    } else {
      state = const SearchPaginationState();
    }
  }

  Future<void> loadInitial() async {
    if (_query.isEmpty) return;
    
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _api.searchRepositories(
        query: _query,
        sort: 'stars',
        page: 1,
        perPage: 30,
      );
      state = state.copyWith(
        items: result.items ?? [],
        currentPage: 1,
        isLoading: false,
        hasMore: (result.items?.length ?? 0) >= 30,
        totalCount: result.totalCount,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore || _query.isEmpty) return;

    state = state.copyWith(isLoading: true);
    try {
      final nextPage = state.currentPage + 1;
      final result = await _api.searchRepositories(
        query: _query,
        sort: 'stars',
        page: nextPage,
        perPage: 30,
      );
      final newItems = result.items ?? [];
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
    state = const SearchPaginationState();
    await loadInitial();
  }
}

/// 搜索分页 Provider
final searchPaginationProvider = StateNotifierProvider<SearchPaginationNotifier, SearchPaginationState>((ref) {
  final api = ref.watch(githubApiProvider);
  final query = ref.watch(searchQueryProvider);
  return SearchPaginationNotifier(api, query);
});
