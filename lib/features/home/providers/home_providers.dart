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

/// 分类搜索 Provider
/// 根据选中的分类和平台搜索 GitHub 仓库
final categorySearchProvider = FutureProvider.family<List<Repository>, SearchParams>((ref, params) async {
  final api = ref.watch(githubApiProvider);
  
  // 获取分类对应的搜索关键词
  final categoryQuery = categoryTopicMap[params.category] ?? 'app';
  
  // 获取平台对应的搜索关键词
  final platformQuery = platformTopicMap[params.platform] ?? '';
  
  // 组合搜索关键词
  final query = platformQuery.isNotEmpty ? '$categoryQuery $platformQuery' : categoryQuery;
  
  // 搜索带有对应关键词的仓库，按星标数排序
  final result = await api.searchRepositories(
    query: query,
    sort: 'stars',
    perPage: 30,
  );
  
  return result.items
          ?.map((item) => Repository(
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
          .toList() ??
      [];
});
