// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryImpl _$$RepositoryImplFromJson(Map<String, dynamic> json) =>
    _$RepositoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String?,
      private: json['private'] as bool?,
      htmlUrl: json['html_url'] as String?,
      homepage: json['homepage'] as String?,
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
      forksCount: (json['forks_count'] as num?)?.toInt(),
      openIssuesCount: (json['open_issues_count'] as num?)?.toInt(),
      language: json['language'] as String?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      license: json['license'] == null
          ? null
          : RepoLicense.fromJson(json['license'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      pushedAt: json['pushed_at'] == null
          ? null
          : DateTime.parse(json['pushed_at'] as String),
    );

Map<String, dynamic> _$$RepositoryImplToJson(_$RepositoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'description': instance.description,
      'private': instance.private,
      'html_url': instance.htmlUrl,
      'homepage': instance.homepage,
      'stargazers_count': instance.stargazersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'language': instance.language,
      'topics': instance.topics,
      'license': instance.license,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'pushed_at': instance.pushedAt?.toIso8601String(),
    };

_$RepoLicenseImpl _$$RepoLicenseImplFromJson(Map<String, dynamic> json) =>
    _$RepoLicenseImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
      spdxId: json['spdx_id'] as String?,
    );

Map<String, dynamic> _$$RepoLicenseImplToJson(_$RepoLicenseImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'spdx_id': instance.spdxId,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num).toInt(),
  login: json['login'] as String,
  avatarUrl: json['avatar_url'] as String,
  name: json['name'] as String?,
  bio: json['bio'] as String?,
  followers: (json['followers'] as num?)?.toInt(),
  following: (json['following'] as num?)?.toInt(),
  publicRepos: (json['public_repos'] as num?)?.toInt(),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'bio': instance.bio,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.publicRepos,
    };
