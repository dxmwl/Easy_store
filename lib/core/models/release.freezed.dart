// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Release _$ReleaseFromJson(Map<String, dynamic> json) {
  return _Release.fromJson(json);
}

/// @nodoc
mixin _$Release {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_name')
  String get tagName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  bool? get draft => throw _privateConstructorUsedError;
  bool? get prerelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  User? get author => throw _privateConstructorUsedError;
  List<ReleaseAsset>? get assets => throw _privateConstructorUsedError;

  /// Serializes this Release to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Release
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReleaseCopyWith<Release> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseCopyWith<$Res> {
  factory $ReleaseCopyWith(Release value, $Res Function(Release) then) =
      _$ReleaseCopyWithImpl<$Res, Release>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'tag_name') String tagName,
    String? name,
    String? body,
    bool? draft,
    bool? prerelease,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    User? author,
    List<ReleaseAsset>? assets,
  });

  $UserCopyWith<$Res>? get author;
}

/// @nodoc
class _$ReleaseCopyWithImpl<$Res, $Val extends Release>
    implements $ReleaseCopyWith<$Res> {
  _$ReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Release
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tagName = null,
    Object? name = freezed,
    Object? body = freezed,
    Object? draft = freezed,
    Object? prerelease = freezed,
    Object? createdAt = freezed,
    Object? publishedAt = freezed,
    Object? author = freezed,
    Object? assets = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            tagName: null == tagName
                ? _value.tagName
                : tagName // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            body: freezed == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String?,
            draft: freezed == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                      as bool?,
            prerelease: freezed == prerelease
                ? _value.prerelease
                : prerelease // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            author: freezed == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as User?,
            assets: freezed == assets
                ? _value.assets
                : assets // ignore: cast_nullable_to_non_nullable
                      as List<ReleaseAsset>?,
          )
          as $Val,
    );
  }

  /// Create a copy of Release
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReleaseImplCopyWith<$Res> implements $ReleaseCopyWith<$Res> {
  factory _$$ReleaseImplCopyWith(
    _$ReleaseImpl value,
    $Res Function(_$ReleaseImpl) then,
  ) = __$$ReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'tag_name') String tagName,
    String? name,
    String? body,
    bool? draft,
    bool? prerelease,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    User? author,
    List<ReleaseAsset>? assets,
  });

  @override
  $UserCopyWith<$Res>? get author;
}

/// @nodoc
class __$$ReleaseImplCopyWithImpl<$Res>
    extends _$ReleaseCopyWithImpl<$Res, _$ReleaseImpl>
    implements _$$ReleaseImplCopyWith<$Res> {
  __$$ReleaseImplCopyWithImpl(
    _$ReleaseImpl _value,
    $Res Function(_$ReleaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Release
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tagName = null,
    Object? name = freezed,
    Object? body = freezed,
    Object? draft = freezed,
    Object? prerelease = freezed,
    Object? createdAt = freezed,
    Object? publishedAt = freezed,
    Object? author = freezed,
    Object? assets = freezed,
  }) {
    return _then(
      _$ReleaseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        tagName: null == tagName
            ? _value.tagName
            : tagName // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        body: freezed == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String?,
        draft: freezed == draft
            ? _value.draft
            : draft // ignore: cast_nullable_to_non_nullable
                  as bool?,
        prerelease: freezed == prerelease
            ? _value.prerelease
            : prerelease // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        author: freezed == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as User?,
        assets: freezed == assets
            ? _value._assets
            : assets // ignore: cast_nullable_to_non_nullable
                  as List<ReleaseAsset>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReleaseImpl implements _Release {
  const _$ReleaseImpl({
    required this.id,
    @JsonKey(name: 'tag_name') required this.tagName,
    this.name,
    this.body,
    this.draft,
    this.prerelease,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'published_at') this.publishedAt,
    this.author,
    final List<ReleaseAsset>? assets,
  }) : _assets = assets;

  factory _$ReleaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReleaseImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'tag_name')
  final String tagName;
  @override
  final String? name;
  @override
  final String? body;
  @override
  final bool? draft;
  @override
  final bool? prerelease;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  @override
  final User? author;
  final List<ReleaseAsset>? _assets;
  @override
  List<ReleaseAsset>? get assets {
    final value = _assets;
    if (value == null) return null;
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Release(id: $id, tagName: $tagName, name: $name, body: $body, draft: $draft, prerelease: $prerelease, createdAt: $createdAt, publishedAt: $publishedAt, author: $author, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReleaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.prerelease, prerelease) ||
                other.prerelease == prerelease) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tagName,
    name,
    body,
    draft,
    prerelease,
    createdAt,
    publishedAt,
    author,
    const DeepCollectionEquality().hash(_assets),
  );

  /// Create a copy of Release
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReleaseImplCopyWith<_$ReleaseImpl> get copyWith =>
      __$$ReleaseImplCopyWithImpl<_$ReleaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReleaseImplToJson(this);
  }
}

abstract class _Release implements Release {
  const factory _Release({
    required final int id,
    @JsonKey(name: 'tag_name') required final String tagName,
    final String? name,
    final String? body,
    final bool? draft,
    final bool? prerelease,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'published_at') final DateTime? publishedAt,
    final User? author,
    final List<ReleaseAsset>? assets,
  }) = _$ReleaseImpl;

  factory _Release.fromJson(Map<String, dynamic> json) = _$ReleaseImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'tag_name')
  String get tagName;
  @override
  String? get name;
  @override
  String? get body;
  @override
  bool? get draft;
  @override
  bool? get prerelease;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  User? get author;
  @override
  List<ReleaseAsset>? get assets;

  /// Create a copy of Release
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReleaseImplCopyWith<_$ReleaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReleaseAsset _$ReleaseAssetFromJson(Map<String, dynamic> json) {
  return _ReleaseAsset.fromJson(json);
}

/// @nodoc
mixin _$ReleaseAsset {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_count')
  int? get downloadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'browser_download_url')
  String? get browserDownloadUrl => throw _privateConstructorUsedError;

  /// Serializes this ReleaseAsset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReleaseAsset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReleaseAssetCopyWith<ReleaseAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseAssetCopyWith<$Res> {
  factory $ReleaseAssetCopyWith(
    ReleaseAsset value,
    $Res Function(ReleaseAsset) then,
  ) = _$ReleaseAssetCopyWithImpl<$Res, ReleaseAsset>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'content_type') String? contentType,
    int? size,
    @JsonKey(name: 'download_count') int? downloadCount,
    @JsonKey(name: 'browser_download_url') String? browserDownloadUrl,
  });
}

/// @nodoc
class _$ReleaseAssetCopyWithImpl<$Res, $Val extends ReleaseAsset>
    implements $ReleaseAssetCopyWith<$Res> {
  _$ReleaseAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReleaseAsset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contentType = freezed,
    Object? size = freezed,
    Object? downloadCount = freezed,
    Object? browserDownloadUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            contentType: freezed == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            downloadCount: freezed == downloadCount
                ? _value.downloadCount
                : downloadCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            browserDownloadUrl: freezed == browserDownloadUrl
                ? _value.browserDownloadUrl
                : browserDownloadUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReleaseAssetImplCopyWith<$Res>
    implements $ReleaseAssetCopyWith<$Res> {
  factory _$$ReleaseAssetImplCopyWith(
    _$ReleaseAssetImpl value,
    $Res Function(_$ReleaseAssetImpl) then,
  ) = __$$ReleaseAssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'content_type') String? contentType,
    int? size,
    @JsonKey(name: 'download_count') int? downloadCount,
    @JsonKey(name: 'browser_download_url') String? browserDownloadUrl,
  });
}

/// @nodoc
class __$$ReleaseAssetImplCopyWithImpl<$Res>
    extends _$ReleaseAssetCopyWithImpl<$Res, _$ReleaseAssetImpl>
    implements _$$ReleaseAssetImplCopyWith<$Res> {
  __$$ReleaseAssetImplCopyWithImpl(
    _$ReleaseAssetImpl _value,
    $Res Function(_$ReleaseAssetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReleaseAsset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contentType = freezed,
    Object? size = freezed,
    Object? downloadCount = freezed,
    Object? browserDownloadUrl = freezed,
  }) {
    return _then(
      _$ReleaseAssetImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        contentType: freezed == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        downloadCount: freezed == downloadCount
            ? _value.downloadCount
            : downloadCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        browserDownloadUrl: freezed == browserDownloadUrl
            ? _value.browserDownloadUrl
            : browserDownloadUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReleaseAssetImpl implements _ReleaseAsset {
  const _$ReleaseAssetImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'content_type') this.contentType,
    this.size,
    @JsonKey(name: 'download_count') this.downloadCount,
    @JsonKey(name: 'browser_download_url') this.browserDownloadUrl,
  });

  factory _$ReleaseAssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReleaseAssetImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'content_type')
  final String? contentType;
  @override
  final int? size;
  @override
  @JsonKey(name: 'download_count')
  final int? downloadCount;
  @override
  @JsonKey(name: 'browser_download_url')
  final String? browserDownloadUrl;

  @override
  String toString() {
    return 'ReleaseAsset(id: $id, name: $name, contentType: $contentType, size: $size, downloadCount: $downloadCount, browserDownloadUrl: $browserDownloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReleaseAssetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.browserDownloadUrl, browserDownloadUrl) ||
                other.browserDownloadUrl == browserDownloadUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    contentType,
    size,
    downloadCount,
    browserDownloadUrl,
  );

  /// Create a copy of ReleaseAsset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReleaseAssetImplCopyWith<_$ReleaseAssetImpl> get copyWith =>
      __$$ReleaseAssetImplCopyWithImpl<_$ReleaseAssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReleaseAssetImplToJson(this);
  }
}

abstract class _ReleaseAsset implements ReleaseAsset {
  const factory _ReleaseAsset({
    required final int id,
    required final String name,
    @JsonKey(name: 'content_type') final String? contentType,
    final int? size,
    @JsonKey(name: 'download_count') final int? downloadCount,
    @JsonKey(name: 'browser_download_url') final String? browserDownloadUrl,
  }) = _$ReleaseAssetImpl;

  factory _ReleaseAsset.fromJson(Map<String, dynamic> json) =
      _$ReleaseAssetImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'content_type')
  String? get contentType;
  @override
  int? get size;
  @override
  @JsonKey(name: 'download_count')
  int? get downloadCount;
  @override
  @JsonKey(name: 'browser_download_url')
  String? get browserDownloadUrl;

  /// Create a copy of ReleaseAsset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReleaseAssetImplCopyWith<_$ReleaseAssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
