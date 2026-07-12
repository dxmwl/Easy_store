// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubCommentImpl _$$GithubCommentImplFromJson(Map<String, dynamic> json) =>
    _$GithubCommentImpl(
      id: (json['id'] as num).toInt(),
      body: json['body'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      htmlUrl: json['html_url'] as String?,
      user: json['user'] == null
          ? null
          : CommentUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GithubCommentImplToJson(_$GithubCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'html_url': instance.htmlUrl,
      'user': instance.user,
    };

_$CommentUserImpl _$$CommentUserImplFromJson(Map<String, dynamic> json) =>
    _$CommentUserImpl(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$CommentUserImplToJson(_$CommentUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
