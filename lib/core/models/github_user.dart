import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_user.freezed.dart';
part 'github_user.g.dart';

@freezed
class GithubUser with _$GithubUser {
  const factory GithubUser({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    String? name,
    String? bio,
    String? blog,
    String? location,
    int? followers,
    int? following,
    @JsonKey(name: 'public_repos') int? publicRepos,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _GithubUser;

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
