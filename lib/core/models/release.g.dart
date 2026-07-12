// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReleaseImpl _$$ReleaseImplFromJson(Map<String, dynamic> json) =>
    _$ReleaseImpl(
      id: (json['id'] as num).toInt(),
      tagName: json['tag_name'] as String,
      name: json['name'] as String?,
      body: json['body'] as String?,
      draft: json['draft'] as bool?,
      prerelease: json['prerelease'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      author: json['author'] == null
          ? null
          : User.fromJson(json['author'] as Map<String, dynamic>),
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => ReleaseAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReleaseImplToJson(_$ReleaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag_name': instance.tagName,
      'name': instance.name,
      'body': instance.body,
      'draft': instance.draft,
      'prerelease': instance.prerelease,
      'created_at': instance.createdAt?.toIso8601String(),
      'published_at': instance.publishedAt?.toIso8601String(),
      'author': instance.author,
      'assets': instance.assets,
    };

_$ReleaseAssetImpl _$$ReleaseAssetImplFromJson(Map<String, dynamic> json) =>
    _$ReleaseAssetImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      contentType: json['content_type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      downloadCount: (json['download_count'] as num?)?.toInt(),
      browserDownloadUrl: json['browser_download_url'] as String?,
    );

Map<String, dynamic> _$$ReleaseAssetImplToJson(_$ReleaseAssetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content_type': instance.contentType,
      'size': instance.size,
      'download_count': instance.downloadCount,
      'browser_download_url': instance.browserDownloadUrl,
    };
