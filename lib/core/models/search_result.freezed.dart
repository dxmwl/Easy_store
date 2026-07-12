// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'incomplete_results')
  bool? get incompleteResults => throw _privateConstructorUsedError;
  List<SearchItem>? get items => throw _privateConstructorUsedError;

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
    SearchResult value,
    $Res Function(SearchResult) then,
  ) = _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'incomplete_results') bool? incompleteResults,
    List<SearchItem>? items,
  });
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            incompleteResults: freezed == incompleteResults
                ? _value.incompleteResults
                : incompleteResults // ignore: cast_nullable_to_non_nullable
                      as bool?,
            items: freezed == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<SearchItem>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
    _$SearchResultImpl value,
    $Res Function(_$SearchResultImpl) then,
  ) = __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_count') int totalCount,
    @JsonKey(name: 'incomplete_results') bool? incompleteResults,
    List<SearchItem>? items,
  });
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
    _$SearchResultImpl _value,
    $Res Function(_$SearchResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = freezed,
    Object? items = freezed,
  }) {
    return _then(
      _$SearchResultImpl(
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        incompleteResults: freezed == incompleteResults
            ? _value.incompleteResults
            : incompleteResults // ignore: cast_nullable_to_non_nullable
                  as bool?,
        items: freezed == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SearchItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl({
    @JsonKey(name: 'total_count') required this.totalCount,
    @JsonKey(name: 'incomplete_results') this.incompleteResults,
    final List<SearchItem>? items,
  }) : _items = items;

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  final bool? incompleteResults;
  final List<SearchItem>? _items;
  @override
  List<SearchItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchResult(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalCount,
    incompleteResults,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(this);
  }
}

abstract class _SearchResult implements SearchResult {
  const factory _SearchResult({
    @JsonKey(name: 'total_count') required final int totalCount,
    @JsonKey(name: 'incomplete_results') final bool? incompleteResults,
    final List<SearchItem>? items,
  }) = _$SearchResultImpl;

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  bool? get incompleteResults;
  @override
  List<SearchItem>? get items;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchItem _$SearchItemFromJson(Map<String, dynamic> json) {
  return _SearchItem.fromJson(json);
}

/// @nodoc
mixin _$SearchItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int? get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int? get forksCount => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  List<String>? get topics => throw _privateConstructorUsedError;
  bool? get private => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  SearchItemOwner? get owner => throw _privateConstructorUsedError;

  /// Serializes this SearchItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchItemCopyWith<SearchItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemCopyWith<$Res> {
  factory $SearchItemCopyWith(
    SearchItem value,
    $Res Function(SearchItem) then,
  ) = _$SearchItemCopyWithImpl<$Res, SearchItem>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'full_name') String fullName,
    String? description,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    String? language,
    List<String>? topics,
    bool? private,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    SearchItemOwner? owner,
  });

  $SearchItemOwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$SearchItemCopyWithImpl<$Res, $Val extends SearchItem>
    implements $SearchItemCopyWith<$Res> {
  _$SearchItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? description = freezed,
    Object? htmlUrl = freezed,
    Object? stargazersCount = freezed,
    Object? forksCount = freezed,
    Object? language = freezed,
    Object? topics = freezed,
    Object? private = freezed,
    Object? updatedAt = freezed,
    Object? owner = freezed,
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
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            htmlUrl: freezed == htmlUrl
                ? _value.htmlUrl
                : htmlUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            stargazersCount: freezed == stargazersCount
                ? _value.stargazersCount
                : stargazersCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            forksCount: freezed == forksCount
                ? _value.forksCount
                : forksCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            language: freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String?,
            topics: freezed == topics
                ? _value.topics
                : topics // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            private: freezed == private
                ? _value.private
                : private // ignore: cast_nullable_to_non_nullable
                      as bool?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            owner: freezed == owner
                ? _value.owner
                : owner // ignore: cast_nullable_to_non_nullable
                      as SearchItemOwner?,
          )
          as $Val,
    );
  }

  /// Create a copy of SearchItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchItemOwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $SearchItemOwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchItemImplCopyWith<$Res>
    implements $SearchItemCopyWith<$Res> {
  factory _$$SearchItemImplCopyWith(
    _$SearchItemImpl value,
    $Res Function(_$SearchItemImpl) then,
  ) = __$$SearchItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'full_name') String fullName,
    String? description,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks_count') int? forksCount,
    String? language,
    List<String>? topics,
    bool? private,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    SearchItemOwner? owner,
  });

  @override
  $SearchItemOwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$SearchItemImplCopyWithImpl<$Res>
    extends _$SearchItemCopyWithImpl<$Res, _$SearchItemImpl>
    implements _$$SearchItemImplCopyWith<$Res> {
  __$$SearchItemImplCopyWithImpl(
    _$SearchItemImpl _value,
    $Res Function(_$SearchItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? description = freezed,
    Object? htmlUrl = freezed,
    Object? stargazersCount = freezed,
    Object? forksCount = freezed,
    Object? language = freezed,
    Object? topics = freezed,
    Object? private = freezed,
    Object? updatedAt = freezed,
    Object? owner = freezed,
  }) {
    return _then(
      _$SearchItemImpl(
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
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        htmlUrl: freezed == htmlUrl
            ? _value.htmlUrl
            : htmlUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        stargazersCount: freezed == stargazersCount
            ? _value.stargazersCount
            : stargazersCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        forksCount: freezed == forksCount
            ? _value.forksCount
            : forksCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        language: freezed == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String?,
        topics: freezed == topics
            ? _value._topics
            : topics // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        private: freezed == private
            ? _value.private
            : private // ignore: cast_nullable_to_non_nullable
                  as bool?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        owner: freezed == owner
            ? _value.owner
            : owner // ignore: cast_nullable_to_non_nullable
                  as SearchItemOwner?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchItemImpl implements _SearchItem {
  const _$SearchItemImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'full_name') required this.fullName,
    this.description,
    @JsonKey(name: 'html_url') this.htmlUrl,
    @JsonKey(name: 'stargazers_count') this.stargazersCount,
    @JsonKey(name: 'forks_count') this.forksCount,
    this.language,
    final List<String>? topics,
    this.private,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.owner,
  }) : _topics = topics;

  factory _$SearchItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String? description;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @override
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  @override
  @JsonKey(name: 'forks_count')
  final int? forksCount;
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
  final bool? private;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final SearchItemOwner? owner;

  @override
  String toString() {
    return 'SearchItem(id: $id, name: $name, fullName: $fullName, description: $description, htmlUrl: $htmlUrl, stargazersCount: $stargazersCount, forksCount: $forksCount, language: $language, topics: $topics, private: $private, updatedAt: $updatedAt, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    fullName,
    description,
    htmlUrl,
    stargazersCount,
    forksCount,
    language,
    const DeepCollectionEquality().hash(_topics),
    private,
    updatedAt,
    owner,
  );

  /// Create a copy of SearchItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemImplCopyWith<_$SearchItemImpl> get copyWith =>
      __$$SearchItemImplCopyWithImpl<_$SearchItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchItemImplToJson(this);
  }
}

abstract class _SearchItem implements SearchItem {
  const factory _SearchItem({
    required final int id,
    required final String name,
    @JsonKey(name: 'full_name') required final String fullName,
    final String? description,
    @JsonKey(name: 'html_url') final String? htmlUrl,
    @JsonKey(name: 'stargazers_count') final int? stargazersCount,
    @JsonKey(name: 'forks_count') final int? forksCount,
    final String? language,
    final List<String>? topics,
    final bool? private,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final SearchItemOwner? owner,
  }) = _$SearchItemImpl;

  factory _SearchItem.fromJson(Map<String, dynamic> json) =
      _$SearchItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String? get description;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;
  @override
  @JsonKey(name: 'stargazers_count')
  int? get stargazersCount;
  @override
  @JsonKey(name: 'forks_count')
  int? get forksCount;
  @override
  String? get language;
  @override
  List<String>? get topics;
  @override
  bool? get private;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  SearchItemOwner? get owner;

  /// Create a copy of SearchItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchItemImplCopyWith<_$SearchItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchItemOwner _$SearchItemOwnerFromJson(Map<String, dynamic> json) {
  return _SearchItemOwner.fromJson(json);
}

/// @nodoc
mixin _$SearchItemOwner {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this SearchItemOwner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchItemOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchItemOwnerCopyWith<SearchItemOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchItemOwnerCopyWith<$Res> {
  factory $SearchItemOwnerCopyWith(
    SearchItemOwner value,
    $Res Function(SearchItemOwner) then,
  ) = _$SearchItemOwnerCopyWithImpl<$Res, SearchItemOwner>;
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
  });
}

/// @nodoc
class _$SearchItemOwnerCopyWithImpl<$Res, $Val extends SearchItemOwner>
    implements $SearchItemOwnerCopyWith<$Res> {
  _$SearchItemOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchItemOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchItemOwnerImplCopyWith<$Res>
    implements $SearchItemOwnerCopyWith<$Res> {
  factory _$$SearchItemOwnerImplCopyWith(
    _$SearchItemOwnerImpl value,
    $Res Function(_$SearchItemOwnerImpl) then,
  ) = __$$SearchItemOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
  });
}

/// @nodoc
class __$$SearchItemOwnerImplCopyWithImpl<$Res>
    extends _$SearchItemOwnerCopyWithImpl<$Res, _$SearchItemOwnerImpl>
    implements _$$SearchItemOwnerImplCopyWith<$Res> {
  __$$SearchItemOwnerImplCopyWithImpl(
    _$SearchItemOwnerImpl _value,
    $Res Function(_$SearchItemOwnerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchItemOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(
      _$SearchItemOwnerImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchItemOwnerImpl implements _SearchItemOwner {
  const _$SearchItemOwnerImpl({
    required this.id,
    required this.login,
    @JsonKey(name: 'avatar_url') required this.avatarUrl,
  });

  factory _$SearchItemOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchItemOwnerImplFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'SearchItemOwner(id: $id, login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchItemOwnerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, avatarUrl);

  /// Create a copy of SearchItemOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchItemOwnerImplCopyWith<_$SearchItemOwnerImpl> get copyWith =>
      __$$SearchItemOwnerImplCopyWithImpl<_$SearchItemOwnerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchItemOwnerImplToJson(this);
  }
}

abstract class _SearchItemOwner implements SearchItemOwner {
  const factory _SearchItemOwner({
    required final int id,
    required final String login,
    @JsonKey(name: 'avatar_url') required final String avatarUrl,
  }) = _$SearchItemOwnerImpl;

  factory _SearchItemOwner.fromJson(Map<String, dynamic> json) =
      _$SearchItemOwnerImpl.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of SearchItemOwner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchItemOwnerImplCopyWith<_$SearchItemOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
