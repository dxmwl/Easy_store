// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GithubComment _$GithubCommentFromJson(Map<String, dynamic> json) {
  return _GithubComment.fromJson(json);
}

/// @nodoc
mixin _$GithubComment {
  int get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String? get htmlUrl => throw _privateConstructorUsedError;
  CommentUser? get user => throw _privateConstructorUsedError;

  /// Serializes this GithubComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubCommentCopyWith<GithubComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubCommentCopyWith<$Res> {
  factory $GithubCommentCopyWith(
    GithubComment value,
    $Res Function(GithubComment) then,
  ) = _$GithubCommentCopyWithImpl<$Res, GithubComment>;
  @useResult
  $Res call({
    int id,
    String body,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'html_url') String? htmlUrl,
    CommentUser? user,
  });

  $CommentUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GithubCommentCopyWithImpl<$Res, $Val extends GithubComment>
    implements $GithubCommentCopyWith<$Res> {
  _$GithubCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? htmlUrl = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
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
                      as CommentUser?,
          )
          as $Val,
    );
  }

  /// Create a copy of GithubComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $CommentUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GithubCommentImplCopyWith<$Res>
    implements $GithubCommentCopyWith<$Res> {
  factory _$$GithubCommentImplCopyWith(
    _$GithubCommentImpl value,
    $Res Function(_$GithubCommentImpl) then,
  ) = __$$GithubCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String body,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'html_url') String? htmlUrl,
    CommentUser? user,
  });

  @override
  $CommentUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GithubCommentImplCopyWithImpl<$Res>
    extends _$GithubCommentCopyWithImpl<$Res, _$GithubCommentImpl>
    implements _$$GithubCommentImplCopyWith<$Res> {
  __$$GithubCommentImplCopyWithImpl(
    _$GithubCommentImpl _value,
    $Res Function(_$GithubCommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? htmlUrl = freezed,
    Object? user = freezed,
  }) {
    return _then(
      _$GithubCommentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
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
                  as CommentUser?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubCommentImpl implements _GithubComment {
  const _$GithubCommentImpl({
    required this.id,
    required this.body,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'html_url') this.htmlUrl,
    this.user,
  });

  factory _$GithubCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubCommentImplFromJson(json);

  @override
  final int id;
  @override
  final String body;
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
  final CommentUser? user;

  @override
  String toString() {
    return 'GithubComment(id: $id, body: $body, createdAt: $createdAt, updatedAt: $updatedAt, htmlUrl: $htmlUrl, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, body, createdAt, updatedAt, htmlUrl, user);

  /// Create a copy of GithubComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubCommentImplCopyWith<_$GithubCommentImpl> get copyWith =>
      __$$GithubCommentImplCopyWithImpl<_$GithubCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubCommentImplToJson(this);
  }
}

abstract class _GithubComment implements GithubComment {
  const factory _GithubComment({
    required final int id,
    required final String body,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    @JsonKey(name: 'html_url') final String? htmlUrl,
    final CommentUser? user,
  }) = _$GithubCommentImpl;

  factory _GithubComment.fromJson(Map<String, dynamic> json) =
      _$GithubCommentImpl.fromJson;

  @override
  int get id;
  @override
  String get body;
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
  CommentUser? get user;

  /// Create a copy of GithubComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubCommentImplCopyWith<_$GithubCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentUser _$CommentUserFromJson(Map<String, dynamic> json) {
  return _CommentUser.fromJson(json);
}

/// @nodoc
mixin _$CommentUser {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this CommentUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentUserCopyWith<CommentUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentUserCopyWith<$Res> {
  factory $CommentUserCopyWith(
    CommentUser value,
    $Res Function(CommentUser) then,
  ) = _$CommentUserCopyWithImpl<$Res, CommentUser>;
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
  });
}

/// @nodoc
class _$CommentUserCopyWithImpl<$Res, $Val extends CommentUser>
    implements $CommentUserCopyWith<$Res> {
  _$CommentUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentUser
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
abstract class _$$CommentUserImplCopyWith<$Res>
    implements $CommentUserCopyWith<$Res> {
  factory _$$CommentUserImplCopyWith(
    _$CommentUserImpl value,
    $Res Function(_$CommentUserImpl) then,
  ) = __$$CommentUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String login,
    @JsonKey(name: 'avatar_url') String avatarUrl,
  });
}

/// @nodoc
class __$$CommentUserImplCopyWithImpl<$Res>
    extends _$CommentUserCopyWithImpl<$Res, _$CommentUserImpl>
    implements _$$CommentUserImplCopyWith<$Res> {
  __$$CommentUserImplCopyWithImpl(
    _$CommentUserImpl _value,
    $Res Function(_$CommentUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(
      _$CommentUserImpl(
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
class _$CommentUserImpl implements _CommentUser {
  const _$CommentUserImpl({
    required this.id,
    required this.login,
    @JsonKey(name: 'avatar_url') required this.avatarUrl,
  });

  factory _$CommentUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentUserImplFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'CommentUser(id: $id, login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, avatarUrl);

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentUserImplCopyWith<_$CommentUserImpl> get copyWith =>
      __$$CommentUserImplCopyWithImpl<_$CommentUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentUserImplToJson(this);
  }
}

abstract class _CommentUser implements CommentUser {
  const factory _CommentUser({
    required final int id,
    required final String login,
    @JsonKey(name: 'avatar_url') required final String avatarUrl,
  }) = _$CommentUserImpl;

  factory _CommentUser.fromJson(Map<String, dynamic> json) =
      _$CommentUserImpl.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of CommentUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentUserImplCopyWith<_$CommentUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
