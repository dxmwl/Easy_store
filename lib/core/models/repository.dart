import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required User owner,
    String? description,
    bool? private,
    @JsonKey(name: 'html_url') String? htmlUrl,
    String? homepage,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    @JsonKey(name: 'open_issues_count') int? openIssuesCount,
    String? language,
    List<String>? topics,
    RepoLicense? license,
    @JsonKey(name: 'default_branch') String? defaultBranch,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') DateTime? pushedAt,
  }) = _Repository;

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}

@freezed
class RepoLicense with _$RepoLicense {
  const factory RepoLicense({
    String? key,
    String? name,
    @JsonKey(name: 'spdx_id') String? spdxId,
  }) = _RepoLicense;

  factory RepoLicense.fromJson(Map<String, dynamic> json) =>
      _$RepoLicenseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    String? name,
    String? bio,
    int? followers,
    int? following,
    @JsonKey(name: 'public_repos') int? publicRepos,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
