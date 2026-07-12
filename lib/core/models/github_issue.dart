import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_issue.freezed.dart';
part 'github_issue.g.dart';

@freezed
class GithubIssue with _$GithubIssue {
  const factory GithubIssue({
    required int id,
    required int number,
    required String title,
    String? body,
    required String state,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'html_url') String? htmlUrl,
    IssueUser? user,
    List<Label>? labels,
    @JsonKey(name: 'comments') int? commentsCount,
  }) = _GithubIssue;

  factory GithubIssue.fromJson(Map<String, dynamic> json) =>
      _$GithubIssueFromJson(json);
}

@freezed
class IssueUser with _$IssueUser {
  const factory IssueUser({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _IssueUser;

  factory IssueUser.fromJson(Map<String, dynamic> json) =>
      _$IssueUserFromJson(json);
}

@freezed
class Label with _$Label {
  const factory Label({
    required int id,
    required String name,
    String? description,
    String? color,
  }) = _Label;

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
}
