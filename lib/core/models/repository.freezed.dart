// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return _Repository.fromJson(json);
}

/// @nodoc
mixin _$Repository {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get private => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int? get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int? get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_issues_count')
  int? get openIssuesCount => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  List<String>? get topics => throw _privateConstructorUsedError;
  RepoLicense? get license => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'pushed_at')
  DateTime? get pushedAt => throw _privateConstructorUsedError;

  /// Serializes this Repository to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoryCopyWith<Repository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryCopyWith<$Res> {
  factory $RepositoryCopyWith(
    Repository value,
    $Res Function(Repository) then,
  ) = _$RepositoryCopyWithImpl<$Res, Repository>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'full_name') String fullName,
    User owner,
    String? description,
    bool? private,
    @JsonKey(name: 'html_url') String? htmlUrl,
    String? homepage,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    @JsonKey(name: 'open_issues_count') int? openIssuesCount,
    String? language,
    List<String>? topics,
    RepoLicense? license,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') DateTime? pushedAt,
  });

  $UserCopyWith<$Res> get owner;
  $RepoLicenseCopyWith<$Res>? get license;
}

/// @nodoc
class _$RepositoryCopyWithImpl<$Res, $Val extends Repository>
    implements $RepositoryCopyWith<$Res> {
  _$RepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? owner = null,
    Object? description = freezed,
    Object? private = freezed,
    Object? htmlUrl = freezed,
    Object? homepage = freezed,
    Object? stargazersCount = freezed,
    Object? forksCount = freezed,
    Object? openIssuesCount = freezed,
    Object? language = freezed,
    Object? topics = freezed,
    Object? license = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? pushedAt = freezed,
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
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            owner: null == owner
                ? _value.owner
                : owner // ignore: cast_nullable_to_non_nullable
                      as User,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            private: freezed == private
                ? _value.private
                : private // ignore: cast_nullable_to_non_nullable
                      as bool?,
            htmlUrl: freezed == htmlUrl
                ? _value.htmlUrl
                : htmlUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            homepage: freezed == homepage
                ? _value.homepage
                : homepage // ignore: cast_nullable_to_non_nullable
                      as String?,
            stargazersCount: freezed == stargazersCount
                ? _value.stargazersCount
                : stargazersCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            forksCount: freezed == forksCount
                ? _value.forksCount
                : forksCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            openIssuesCount: freezed == openIssuesCount
                ? _value.openIssuesCount
                : openIssuesCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            language: freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String?,
            topics: freezed == topics
                ? _value.topics
                : topics // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            license: freezed == license
                ? _value.license
                : license // ignore: cast_nullable_to_non_nullable
                      as RepoLicense?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            pushedAt: freezed == pushedAt
                ? _value.pushedAt
                : pushedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepoLicenseCopyWith<$Res>? get license {
    if (_value.license == null) {
      return null;
    }

    return $RepoLicenseCopyWith<$Res>(_value.license!, (value) {
      return _then(_value.copyWith(license: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepositoryImplCopyWith<$Res>
    implements $RepositoryCopyWith<$Res> {
  factory _$$RepositoryImplCopyWith(
    _$RepositoryImpl value,
    $Res Function(_$RepositoryImpl) then,
  ) = __$$RepositoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'full_name') String fullName,
    User owner,
    String? description,
    bool? private,
    @JsonKey(name: 'html_url') String? htmlUrl,
    String? homepage,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    @JsonKey(name: 'open_issues_count') int? openIssuesCount,
    String? language,
    List<String>? topics,
    RepoLicense? license,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') DateTime? pushedAt,
  });

  @override
  $UserCopyWith<$Res> get owner;
  @override
  $RepoLicenseCopyWith<$Res>? get license;
}

/// @nodoc
class __$$RepositoryImplCopyWithImpl<$Res>
    extends _$RepositoryCopyWithImpl<$Res, _$RepositoryImpl>
    implements _$$RepositoryImplCopyWith<$Res> {
  __$$RepositoryImplCopyWithImpl(
    _$RepositoryImpl _value,
    $Res Function(_$RepositoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? owner = null,
    Object? description = freezed,
    Object? private = freezed,
    Object? htmlUrl = freezed,
    Object? homepage = freezed,
    Object? stargazersCount = freezed,
    Object? forksCount = freezed,
    Object? openIssuesCount = freezed,
    Object? language = freezed,
    Object? topics = freezed,
    Object? license = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? pushedAt = freezed,
  }) {
    return _then(
      _$RepositoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        owner: null == owner
            ? _value.owner
            : owner // ignore: cast_nullable_to_non_nullable
                  as User,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        private: freezed == private
            ? _value.private
            : private // ignore: cast_nullable_to_non_nullable
                  as bool?,
        htmlUrl: freezed == htmlUrl
            ? _value.htmlUrl
            : htmlUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        homepage: freezed == homepage
            ? _value.homepage
            : homepage // ignore: cast_nullable_to_non_nullable
                  as String?,
        stargazersCount: freezed == stargazersCount
            ? _value.stargazersCount
            : stargazersCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        forksCount: freezed == forksCount
            ? _value.forksCount
            : forksCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        openIssuesCount: freezed == openIssuesCount
            ? _value.openIssuesCount
            : openIssuesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        language: freezed == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String?,
        topics: freezed == topics
            ? _value._topics
            : topics // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        license: freezed == license
            ? _value.license
            : license // ignore: cast_nullable_to_non_nullable
                  as RepoLicense?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pushedAt: freezed == pushedAt
            ? _value.pushedAt
            : pushedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositoryImpl implements _Repository {
  const _$RepositoryImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'full_name') required this.fullName,
    required this.owner,
    this.description,
    this.private,
    @JsonKey(name: 'html_url') this.htmlUrl,
    this.homepage,
    @JsonKey(name: 'stargazers_count') this.stargazersCount,
    @JsonKey(name: 'forks_count') this.forksCount,
    @JsonKey(name: 'open_issues_count') this.openIssuesCount,
    this.language,
    final List<String>? topics,
    this.license,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'pushed_at') this.pushedAt,
  }) : _topics = topics;

  factory _$RepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final User owner;
  @override
  final String? description;
  @override
  final bool? private;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @override
  final String? homepage;
  @override
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  @override
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  final int? openIssuesCount;
  @override
  final String? language;
  final List<String>? _topics;
  @override
  List<String>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RepoLicense? license;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'pushed_at')
  final DateTime? pushedAt;

  @override
  String toString() {
    return 'Repository(id: $id, name: $name, fullName: $fullName, owner: $owner, description: $description, private: $private, htmlUrl: $htmlUrl, homepage: $homepage, stargazersCount: $stargazersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount, language: $language, topics: $topics, license: $license, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.openIssuesCount, openIssuesCount) ||
                other.openIssuesCount == openIssuesCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.pushedAt, pushedAt) ||
                other.pushedAt == pushedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    fullName,
    owner,
    description,
    private,
    htmlUrl,
    homepage,
    stargazersCount,
    forksCount,
    openIssuesCount,
    language,
    const DeepCollectionEquality().hash(_topics),
    license,
    createdAt,
    updatedAt,
    pushedAt,
  );

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryImplCopyWith<_$RepositoryImpl> get copyWith =>
      __$$RepositoryImplCopyWithImpl<_$RepositoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositoryImplToJson(this);
  }
}

abstract class _Repository implements Repository {
  const factory _Repository({
    required final int id,
    required final String name,
    @JsonKey(name: 'full_name') required final String fullName,
    required final User owner,
    final String? description,
    final bool? private,
    @JsonKey(name: 'html_url') final String? htmlUrl,
    final String? homepage,
    @JsonKey(name: 'stargazers_count') final int? stargazersCount,
    @JsonKey(name: 'forks_count') final int? forksCount,
    @JsonKey(name: 'open_issues_count') final int? openIssuesCount,
    final String? language,
    final List<String>? topics,
    final RepoLicense? license,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'pushed_at') final DateTime? pushedAt,
  }) = _$RepositoryImpl;

  factory _Repository.fromJson(Map<String, dynamic> json) =
      _$RepositoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  User get owner;
  @override
  String? get description;
  @override
  bool? get private;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;
  @override
  String? get homepage;
  @override
  @JsonKey(name: 'stargazers_count')
  int? get stargazersCount;
  @override
  @JsonKey(name: 'forks_count')
  int? get forksCount;
  @override
  @JsonKey(name: 'open_issues_count')
  int? get openIssuesCount;
  @override
  String? get language;
  @override
  List<String>? get topics;
  @override
  RepoLicense? get license;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'pushed_at')
  DateTime? get pushedAt;

  /// Create a copy of Repository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoryImplCopyWith<_$RepositoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepoLicense _$RepoLicenseFromJson(Map<String, dynamic> json) {
  return _RepoLicense.fromJson(json);
}

/// @nodoc
mixin _$RepoLicense {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'spdx_id')
  String? get spdxId => throw _privateConstructorUsedError;

  /// Serializes this RepoLicense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepoLicense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoLicenseCopyWith<RepoLicense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoLicenseCopyWith<$Res> {
  factory $RepoLicenseCopyWith(
    RepoLicense value,
    $Res Function(RepoLicense) then,
  ) = _$RepoLicenseCopyWithImpl<$Res, RepoLicense>;
  @useResult
  $Res call({
    String? key,
    String? name,
    @JsonKey(name: 'spdx_id') String? spdxId,
  });
}

/// @nodoc
class _$RepoLicenseCopyWithImpl<$Res, $Val extends RepoLicense>
    implements $RepoLicenseCopyWith<$Res> {
  _$RepoLicenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoLicense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? spdxId = freezed,
  }) {
    return _then(
      _value.copyWith(
            key: freezed == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            spdxId: freezed == spdxId
                ? _value.spdxId
                : spdxId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RepoLicenseImplCopyWith<$Res>
    implements $RepoLicenseCopyWith<$Res> {
  factory _$$RepoLicenseImplCopyWith(
    _$RepoLicenseImpl value,
    $Res Function(_$RepoLicenseImpl) then,
  ) = __$$RepoLicenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? key,
    String? name,
    @JsonKey(name: 'spdx_id') String? spdxId,
  });
}

/// @nodoc
class __$$RepoLicenseImplCopyWithImpl<$Res>
    extends _$RepoLicenseCopyWithImpl<$Res, _$RepoLicenseImpl>
    implements _$$RepoLicenseImplCopyWith<$Res> {
  __$$RepoLicenseImplCopyWithImpl(
    _$RepoLicenseImpl _value,
    $Res Function(_$RepoLicenseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RepoLicense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? spdxId = freezed,
  }) {
    return _then(
      _$RepoLicenseImpl(
        key: freezed == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        spdxId: freezed == spdxId
            ? _value.spdxId
            : spdxId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RepoLicenseImpl implements _RepoLicense {
  const _$RepoLicenseImpl({
    this.key,
    this.name,
    @JsonKey(name: 'spdx_id') this.spdxId,
  });

  factory _$RepoLicenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepoLicenseImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;
  @override
  @JsonKey(name: 'spdx_id')
  final String? spdxId;

  @override
  String toString() {
    return 'RepoLicense(key: $key, name: $name, spdxId: $spdxId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoLicenseImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.spdxId, spdxId) || other.spdxId == spdxId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, spdxId);

  /// Create a copy of RepoLicense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoLicenseImplCopyWith<_$RepoLicenseImpl> get copyWith =>
      __$$RepoLicenseImplCopyWithImpl<_$RepoLicenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepoLicenseImplToJson(this);
  }
}

abstract class _RepoLicense implements RepoLicense {
  const factory _RepoLicense({
    final String? key,
    final String? name,
    @JsonKey(name: 'spdx_id') final String? spdxId,
  }) = _$RepoLicenseImpl;

  factory _RepoLicense.fromJson(Map<String, dynamic> json) =
      _$RepoLicenseImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;
  @override
  @JsonKey(name: 'spdx_id')
  String? get spdxId;

  /// Create a copy of RepoLicense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoLicenseImplCopyWith<_$RepoLicenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  int? get followers => throw _privateConstructorUsedError;
  int? get following => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_repos')
  int? get publicRepos => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
    String? name,
    String? bio,
    int? followers,
    int? following,
    @JsonKey(name: 'public_repos') int? publicRepos,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
    Object? name = freezed,
    Object? bio = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? publicRepos = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            login: null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: null == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            followers: freezed == followers
                ? _value.followers
                : followers // ignore: cast_nullable_to_non_nullable
                      as int?,
            following: freezed == following
                ? _value.following
                : following // ignore: cast_nullable_to_non_nullable
                      as int?,
            publicRepos: freezed == publicRepos
                ? _value.publicRepos
                : publicRepos // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
    String? name,
    String? bio,
    int? followers,
    int? following,
    @JsonKey(name: 'public_repos') int? publicRepos,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
    Object? name = freezed,
    Object? bio = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? publicRepos = freezed,
  }) {
    return _then(
      _$UserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        login: null == login
            ? _value.login
            : login // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: null == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        followers: freezed == followers
            ? _value.followers
            : followers // ignore: cast_nullable_to_non_nullable
                  as int?,
        following: freezed == following
            ? _value.following
            : following // ignore: cast_nullable_to_non_nullable
                  as int?,
        publicRepos: freezed == publicRepos
            ? _value.publicRepos
            : publicRepos // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.id,
    required this.login,
    @JsonKey(name: 'avatar_url') required this.avatarUrl,
    this.name,
    this.bio,
    this.followers,
    this.following,
    @JsonKey(name: 'public_repos') this.publicRepos,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  final String? name;
  @override
  final String? bio;
  @override
  final int? followers;
  @override
  final int? following;
  @override
  @JsonKey(name: 'public_repos')
  final int? publicRepos;

  @override
  String toString() {
    return 'User(id: $id, login: $login, avatarUrl: $avatarUrl, name: $name, bio: $bio, followers: $followers, following: $following, publicRepos: $publicRepos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.publicRepos, publicRepos) ||
                other.publicRepos == publicRepos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    login,
    avatarUrl,
    name,
    bio,
    followers,
    following,
    publicRepos,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final int id,
    required final String login,
    @JsonKey(name: 'avatar_url') required final String avatarUrl,
    final String? name,
    final String? bio,
    final int? followers,
    final int? following,
    @JsonKey(name: 'public_repos') final int? publicRepos,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  String? get name;
  @override
  String? get bio;
  @override
  int? get followers;
  @override
  int? get following;
  @override
  @JsonKey(name: 'public_repos')
  int? get publicRepos;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
