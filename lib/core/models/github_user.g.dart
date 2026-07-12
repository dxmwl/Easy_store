// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubUserImpl _$$GithubUserImplFromJson(Map<String, dynamic> json) =>
    _$GithubUserImpl(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      blog: json['blog'] as String?,
      location: json['location'] as String?,
      followers: (json['followers'] as num?)?.toInt(),
      following: (json['following'] as num?)?.toInt(),
      publicRepos: (json['public_repos'] as num?)?.toInt(),
      htmlUrl: json['html_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$GithubUserImplToJson(_$GithubUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'bio': instance.bio,
      'blog': instance.blog,
      'location': instance.location,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.publicRepos,
      'html_url': instance.htmlUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };
