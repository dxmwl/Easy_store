// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      totalCount: (json['total_count'] as num).toInt(),
      incompleteResults: json['incomplete_results'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SearchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };

_$SearchItemImpl _$$SearchItemImplFromJson(Map<String, dynamic> json) =>
    _$SearchItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      htmlUrl: json['html_url'] as String?,
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
      forksCount: (json['forks_count'] as num?)?.toInt(),
      language: json['language'] as String?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      private: json['private'] as bool?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      owner: json['owner'] == null
          ? null
          : SearchItemOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchItemImplToJson(_$SearchItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'description': instance.description,
      'html_url': instance.htmlUrl,
      'stargazers_count': instance.stargazersCount,
      'forks_count': instance.forksCount,
      'language': instance.language,
      'topics': instance.topics,
      'private': instance.private,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'owner': instance.owner,
    };

_$SearchItemOwnerImpl _$$SearchItemOwnerImplFromJson(
  Map<String, dynamic> json,
) => _$SearchItemOwnerImpl(
  id: (json['id'] as num).toInt(),
  login: json['login'] as String,
  avatarUrl: json['avatar_url'] as String,
);

Map<String, dynamic> _$$SearchItemOwnerImplToJson(
  _$SearchItemOwnerImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'login': instance.login,
  'avatar_url': instance.avatarUrl,
};
