import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/github_api.dart';
import '../../../core/models/search_result.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<SearchResult?>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return null;
  
  final api = ref.watch(githubApiProvider);
  return api.searchRepositories(query: query);
});
