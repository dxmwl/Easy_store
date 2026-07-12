import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_comment.freezed.dart';
part 'github_comment.g.dart';

@freezed
class GithubComment with _$GithubComment {
  const factory GithubComment({
    required int id,
    required String body,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'html_url') String? htmlUrl,
    CommentUser? user,
  }) = _GithubComment;

  factory GithubComment.fromJson(Map<String, dynamic> json) =>
      _$GithubCommentFromJson(json);
}

@freezed
class CommentUser with _$CommentUser {
  const factory CommentUser({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _CommentUser;

  factory CommentUser.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFromJson(json);
}
