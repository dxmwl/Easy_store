// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GithubIssue _$GithubIssueFromJson(Map<String, dynamic> json) {
  return _GithubIssue.fromJson(json);
}

/// @nodoc
mixin _$GithubIssue {
  int get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  IssueUser? get user => throw _privateConstructorUsedError;
  List<Label>? get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments')
  int? get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this GithubIssue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubIssueCopyWith<GithubIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubIssueCopyWith<$Res> {
  factory $GithubIssueCopyWith(
    GithubIssue value,
    $Res Function(GithubIssue) then,
  ) = _$GithubIssueCopyWithImpl<$Res, GithubIssue>;
  @useResult
  $Res call({
    int id,
    int number,
    String title,
    String? body,
    String state,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'html_url') String? htmlUrl,
    IssueUser? user,
    List<Label>? labels,
    @JsonKey(name: 'comments') int? commentsCount,
  });

  $IssueUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GithubIssueCopyWithImpl<$Res, $Val extends GithubIssue>
    implements $GithubIssueCopyWith<$Res> {
  _$GithubIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? title = null,
    Object? body = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? htmlUrl = freezed,
    Object? user = freezed,
    Object? labels = freezed,
    Object? commentsCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: freezed == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            htmlUrl: freezed == htmlUrl
                ? _value.htmlUrl
                : htmlUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as IssueUser?,
            labels: freezed == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<Label>?,
            commentsCount: freezed == commentsCount
                ? _value.commentsCount
                : commentsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of GithubIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IssueUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $IssueUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubIssueImplCopyWith<$Res>
    implements $GithubIssueCopyWith<$Res> {
  factory _$$GithubIssueImplCopyWith(
    _$GithubIssueImpl value,
    $Res Function(_$GithubIssueImpl) then,
  ) = __$$GithubIssueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int number,
    String title,
    String? body,
    String state,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'html_url') String? htmlUrl,
    IssueUser? user,
    List<Label>? labels,
    @JsonKey(name: 'comments') int? commentsCount,
  });

  @override
  $IssueUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GithubIssueImplCopyWithImpl<$Res>
    extends _$GithubIssueCopyWithImpl<$Res, _$GithubIssueImpl>
    implements _$$GithubIssueImplCopyWith<$Res> {
  __$$GithubIssueImplCopyWithImpl(
    _$GithubIssueImpl _value,
    $Res Function(_$GithubIssueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? title = null,
    Object? body = freezed,
    Object? state = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? htmlUrl = freezed,
    Object? user = freezed,
    Object? labels = freezed,
    Object? commentsCount = freezed,
  }) {
    return _then(
      _$GithubIssueImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: freezed == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        htmlUrl: freezed == htmlUrl
            ? _value.htmlUrl
            : htmlUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as IssueUser?,
        labels: freezed == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<Label>?,
        commentsCount: freezed == commentsCount
            ? _value.commentsCount
            : commentsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubIssueImpl implements _GithubIssue {
  const _$GithubIssueImpl({
    required this.id,
    required this.number,
    required this.title,
    this.body,
    required this.state,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'html_url') this.htmlUrl,
    this.user,
    final List<Label>? labels,
    @JsonKey(name: 'comments') this.commentsCount,
  }) : _labels = labels;

  factory _$GithubIssueImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubIssueImplFromJson(json);

  @override
  final int id;
  @override
  final int number;
  @override
  final String title;
  @override
  final String? body;
  @override
  final String state;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @override
  final IssueUser? user;
  final List<Label>? _labels;
  @override
  List<Label>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'comments')
  final int? commentsCount;

  @override
  String toString() {
    return 'GithubIssue(id: $id, number: $number, title: $title, body: $body, state: $state, createdAt: $createdAt, updatedAt: $updatedAt, htmlUrl: $htmlUrl, user: $user, labels: $labels, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubIssueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    title,
    body,
    state,
    createdAt,
    updatedAt,
    htmlUrl,
    user,
    const DeepCollectionEquality().hash(_labels),
    commentsCount,
  );

  /// Create a copy of GithubIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubIssueImplCopyWith<_$GithubIssueImpl> get copyWith =>
      __$$GithubIssueImplCopyWithImpl<_$GithubIssueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubIssueImplToJson(this);
  }
}

abstract class _GithubIssue implements GithubIssue {
  const factory _GithubIssue({
    required final int id,
    required final int number,
    required final String title,
    final String? body,
    required final String state,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'html_url') final String? htmlUrl,
    final IssueUser? user,
    final List<Label>? labels,
    @JsonKey(name: 'comments') final int? commentsCount,
  }) = _$GithubIssueImpl;

  factory _GithubIssue.fromJson(Map<String, dynamic> json) =
      _$GithubIssueImpl.fromJson;

  @override
  int get id;
  @override
  int get number;
  @override
  String get title;
  @override
  String? get body;
  @override
  String get state;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'html_url')
  String? get htmlUrl;
  @override
  IssueUser? get user;
  @override
  List<Label>? get labels;
  @override
  @JsonKey(name: 'comments')
  int? get commentsCount;

  /// Create a copy of GithubIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubIssueImplCopyWith<_$GithubIssueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IssueUser _$IssueUserFromJson(Map<String, dynamic> json) {
  return _IssueUser.fromJson(json);
}

/// @nodoc
mixin _$IssueUser {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this IssueUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IssueUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IssueUserCopyWith<IssueUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueUserCopyWith<$Res> {
  factory $IssueUserCopyWith(IssueUser value, $Res Function(IssueUser) then) =
      _$IssueUserCopyWithImpl<$Res, IssueUser>;
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
  });
}

/// @nodoc
class _$IssueUserCopyWithImpl<$Res, $Val extends IssueUser>
    implements $IssueUserCopyWith<$Res> {
  _$IssueUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IssueUser
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
abstract class _$$IssueUserImplCopyWith<$Res>
    implements $IssueUserCopyWith<$Res> {
  factory _$$IssueUserImplCopyWith(
    _$IssueUserImpl value,
    $Res Function(_$IssueUserImpl) then,
  ) = __$$IssueUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
  });
}

/// @nodoc
class __$$IssueUserImplCopyWithImpl<$Res>
    extends _$IssueUserCopyWithImpl<$Res, _$IssueUserImpl>
    implements _$$IssueUserImplCopyWith<$Res> {
  __$$IssueUserImplCopyWithImpl(
    _$IssueUserImpl _value,
    $Res Function(_$IssueUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IssueUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(
      _$IssueUserImpl(
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
class _$IssueUserImpl implements _IssueUser {
  const _$IssueUserImpl({
    required this.id,
    required this.login,
    @JsonKey(name: 'avatar_url') required this.avatarUrl,
  });

  factory _$IssueUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssueUserImplFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'IssueUser(id: $id, login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, avatarUrl);

  /// Create a copy of IssueUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueUserImplCopyWith<_$IssueUserImpl> get copyWith =>
      __$$IssueUserImplCopyWithImpl<_$IssueUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssueUserImplToJson(this);
  }
}

abstract class _IssueUser implements IssueUser {
  const factory _IssueUser({
    required final int id,
    required final String login,
    @JsonKey(name: 'avatar_url') required final String avatarUrl,
  }) = _$IssueUserImpl;

  factory _IssueUser.fromJson(Map<String, dynamic> json) =
      _$IssueUserImpl.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of IssueUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IssueUserImplCopyWith<_$IssueUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Label _$LabelFromJson(Map<String, dynamic> json) {
  return _Label.fromJson(json);
}

/// @nodoc
mixin _$Label {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this Label to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Label
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabelCopyWith<Label> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelCopyWith<$Res> {
  factory $LabelCopyWith(Label value, $Res Function(Label) then) =
      _$LabelCopyWithImpl<$Res, Label>;
  @useResult
  $Res call({int id, String name, String? description, String? color});
}

/// @nodoc
class _$LabelCopyWithImpl<$Res, $Val extends Label>
    implements $LabelCopyWith<$Res> {
  _$LabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Label
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? color = freezed,
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
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LabelImplCopyWith<$Res> implements $LabelCopyWith<$Res> {
  factory _$$LabelImplCopyWith(
    _$LabelImpl value,
    $Res Function(_$LabelImpl) then,
  ) = __$$LabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description, String? color});
}

/// @nodoc
class __$$LabelImplCopyWithImpl<$Res>
    extends _$LabelCopyWithImpl<$Res, _$LabelImpl>
    implements _$$LabelImplCopyWith<$Res> {
  __$$LabelImplCopyWithImpl(
    _$LabelImpl _value,
    $Res Function(_$LabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Label
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? color = freezed,
  }) {
    return _then(
      _$LabelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelImpl implements _Label {
  const _$LabelImpl({
    required this.id,
    required this.name,
    this.description,
    this.color,
  });

  factory _$LabelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? color;

  @override
  String toString() {
    return 'Label(id: $id, name: $name, description: $description, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, color);

  /// Create a copy of Label
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelImplCopyWith<_$LabelImpl> get copyWith =>
      __$$LabelImplCopyWithImpl<_$LabelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelImplToJson(this);
  }
}

abstract class _Label implements Label {
  const factory _Label({
    required final int id,
    required final String name,
    final String? description,
    final String? color,
  }) = _$LabelImpl;

  factory _Label.fromJson(Map<String, dynamic> json) = _$LabelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get color;

  /// Create a copy of Label
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelImplCopyWith<_$LabelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
