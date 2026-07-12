// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubIssueImpl _$$GithubIssueImplFromJson(Map<String, dynamic> json) =>
    _$GithubIssueImpl(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String?,
      state: json['state'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      htmlUrl: json['html_url'] as String?,
      user: json['user'] == null
          ? null
          : IssueUser.fromJson(json['user'] as Map<String, dynamic>),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: (json['comments'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GithubIssueImplToJson(_$GithubIssueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'title': instance.title,
      'body': instance.body,
      'state': instance.state,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'html_url': instance.htmlUrl,
      'user': instance.user,
      'labels': instance.labels,
      'comments': instance.commentsCount,
    };

_$IssueUserImpl _$$IssueUserImplFromJson(Map<String, dynamic> json) =>
    _$IssueUserImpl(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$IssueUserImplToJson(_$IssueUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };

_$LabelImpl _$$LabelImplFromJson(Map<String, dynamic> json) => _$LabelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  color: json['color'] as String?,
);

Map<String, dynamic> _$$LabelImplToJson(_$LabelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
    };
