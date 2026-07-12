import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/repository.dart';
import '../../core/models/release.dart';
import '../../core/models/search_result.dart';
import '../../core/models/github_issue.dart';
import '../../core/models/github_comment.dart';
import '../../core/models/github_user.dart';

final githubApiProvider = Provider<GithubApi>((ref) {
  return GithubApi();
});

class GithubApi {
  static const String _baseUrl = 'https://api.github.com';
  final Dio _dio;

  GithubApi() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Accept': 'application/vnd.github.v3+json',
      'User-Agent': 'EasyStore/1.0',
    };
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  void setToken(String? token) {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  Future<SearchResult> searchRepositories({
    required String query,
    String? language,
    String? sort,
    int page = 1,
    int perPage = 30,
  }) async {
    String q = query;
    if (language != null && language.isNotEmpty) {
      q += ' language:$language';
    }

    final response = await _dio.get('/search/repositories', queryParameters: {
      'q': q,
      'sort': sort,
      'page': page,
      'per_page': perPage,
    });

    return SearchResult.fromJson(response.data);
  }

  Future<List<Repository>> getTrendingRepositories({
    String? language,
    int page = 1,
    int perPage = 30,
  }) async {
    final q = language != null && language.isNotEmpty
        ? 'stars:>100 language:$language'
        : 'stars:>100';

    final response = await _dio.get('/search/repositories', queryParameters: {
      'q': q,
      'sort': 'stars',
      'order': 'desc',
      'page': page,
      'per_page': perPage,
    });

    final data = SearchResult.fromJson(response.data);
    return data.items
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
                    id: 0,
                    login: item.fullName.split('/').first,
                    avatarUrl: '',
                  ),
                ))
            .toList() ??
        [];
  }

  Future<List<Repository>> getRecentlyUpdated({
    String? language,
    int page = 1,
    int perPage = 30,
  }) async {
    final q = language != null && language.isNotEmpty
        ? 'stars:>50 language:$language'
        : 'stars:>50';

    final response = await _dio.get('/search/repositories', queryParameters: {
      'q': q,
      'sort': 'updated',
      'order': 'desc',
      'page': page,
      'per_page': perPage,
    });

    final data = SearchResult.fromJson(response.data);
    return data.items
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
                    id: 0,
                    login: item.fullName.split('/').first,
                    avatarUrl: '',
                  ),
                ))
            .toList() ??
        [];
  }

  Future<Repository> getRepository(String owner, String repo) async {
    final response = await _dio.get('/repos/$owner/$repo');
    return Repository.fromJson(response.data);
  }

  Future<List<Release>> getReleases(
    String owner,
    String repo, {
    int page = 1,
    int perPage = 30,
  }) async {
    final response = await _dio.get(
      '/repos/$owner/$repo/releases',
      queryParameters: {'page': page, 'per_page': perPage},
    );

    return (response.data as List)
        .map((e) => Release.fromJson(e))
        .toList();
  }

  Future<String> getReadme(String owner, String repo) async {
    try {
      final response = await _dio.get(
        '/repos/$owner/$repo/readme',
        options: Options(
          headers: {'Accept': 'application/vnd.github.v3.raw'},
        ),
      );
      if (response.data is String) {
        return response.data;
      }
      return response.data['content'] ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<List<GithubIssue>> getIssues(
    String owner,
    String repo, {
    String state = 'open',
    int page = 1,
    int perPage = 30,
  }) async {
    final response = await _dio.get(
      '/repos/$owner/$repo/issues',
      queryParameters: {
        'state': state,
        'page': page,
        'per_page': perPage,
      },
    );

    return (response.data as List)
        .map((e) => GithubIssue.fromJson(e))
        .toList();
  }

  Future<GithubIssue> getIssue(String owner, String repo, int issueNumber) async {
    final response = await _dio.get('/repos/$owner/$repo/issues/$issueNumber');
    return GithubIssue.fromJson(response.data);
  }

  Future<List<GithubComment>> getComments(
    String owner,
    String repo,
    int issueNumber, {
    int page = 1,
    int perPage = 30,
  }) async {
    final response = await _dio.get(
      '/repos/$owner/$repo/issues/$issueNumber/comments',
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );

    return (response.data as List)
        .map((e) => GithubComment.fromJson(e))
        .toList();
  }

  Future<GithubUser> getUser(String username) async {
    final response = await _dio.get('/users/$username');
    return GithubUser.fromJson(response.data);
  }

  Future<List<Repository>> getUserRepos(
    String username, {
    int page = 1,
    int perPage = 30,
    String sort = 'updated',
  }) async {
    final response = await _dio.get(
      '/users/$username/repos',
      queryParameters: {
        'page': page,
        'per_page': perPage,
        'sort': sort,
        'direction': 'desc',
      },
    );

    return (response.data as List)
        .map((e) => Repository.fromJson(e))
        .toList();
  }
}
