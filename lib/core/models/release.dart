import 'package:freezed_annotation/freezed_annotation.dart';
import 'repository.dart';

part 'release.freezed.dart';
part 'release.g.dart';

@freezed
class Release with _$Release {
  const factory Release({
    required int id,
    @JsonKey(name: 'tag_name') required String tagName,
    String? name,
    String? body,
    bool? draft,
    bool? prerelease,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    User? author,
    List<ReleaseAsset>? assets,
  }) = _Release;

  factory Release.fromJson(Map<String, dynamic> json) =>
      _$ReleaseFromJson(json);
}

@freezed
class ReleaseAsset with _$ReleaseAsset {
  const factory ReleaseAsset({
    required int id,
    required String name,
    @JsonKey(name: 'content_type') String? contentType,
    int? size,
    @JsonKey(name: 'download_count') int? downloadCount,
    @JsonKey(name: 'browser_download_url') String? browserDownloadUrl,
  }) = _ReleaseAsset;

  factory ReleaseAsset.fromJson(Map<String, dynamic> json) =>
      _$ReleaseAssetFromJson(json);
}
