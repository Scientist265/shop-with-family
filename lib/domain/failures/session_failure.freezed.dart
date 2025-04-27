// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) databaseError,
    required TResult Function() notFound,
    required TResult Function() sessionExpired,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? databaseError,
    TResult? Function()? notFound,
    TResult? Function()? sessionExpired,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? databaseError,
    TResult Function()? notFound,
    TResult Function()? sessionExpired,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionFailureCopyWith<$Res> {
  factory $SessionFailureCopyWith(
          SessionFailure value, $Res Function(SessionFailure) then) =
      _$SessionFailureCopyWithImpl<$Res, SessionFailure>;
}

/// @nodoc
class _$SessionFailureCopyWithImpl<$Res, $Val extends SessionFailure>
    implements $SessionFailureCopyWith<$Res> {
  _$SessionFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DatabaseErrorImplCopyWith<$Res> {
  factory _$$DatabaseErrorImplCopyWith(
          _$DatabaseErrorImpl value, $Res Function(_$DatabaseErrorImpl) then) =
      __$$DatabaseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$DatabaseErrorImplCopyWithImpl<$Res>
    extends _$SessionFailureCopyWithImpl<$Res, _$DatabaseErrorImpl>
    implements _$$DatabaseErrorImplCopyWith<$Res> {
  __$$DatabaseErrorImplCopyWithImpl(
      _$DatabaseErrorImpl _value, $Res Function(_$DatabaseErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$DatabaseErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DatabaseErrorImpl extends _DatabaseError {
  const _$DatabaseErrorImpl(this.message) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'SessionFailure.databaseError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseErrorImplCopyWith<_$DatabaseErrorImpl> get copyWith =>
      __$$DatabaseErrorImplCopyWithImpl<_$DatabaseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) databaseError,
    required TResult Function() notFound,
    required TResult Function() sessionExpired,
    required TResult Function() unknownError,
  }) {
    return databaseError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? databaseError,
    TResult? Function()? notFound,
    TResult? Function()? sessionExpired,
    TResult? Function()? unknownError,
  }) {
    return databaseError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? databaseError,
    TResult Function()? notFound,
    TResult Function()? sessionExpired,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (databaseError != null) {
      return databaseError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return databaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return databaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (databaseError != null) {
      return databaseError(this);
    }
    return orElse();
  }
}

abstract class _DatabaseError extends SessionFailure {
  const factory _DatabaseError(final String? message) = _$DatabaseErrorImpl;
  const _DatabaseError._() : super._();

  String? get message;

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseErrorImplCopyWith<_$DatabaseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$SessionFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'SessionFailure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) databaseError,
    required TResult Function() notFound,
    required TResult Function() sessionExpired,
    required TResult Function() unknownError,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? databaseError,
    TResult? Function()? notFound,
    TResult? Function()? sessionExpired,
    TResult? Function()? unknownError,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? databaseError,
    TResult Function()? notFound,
    TResult Function()? sessionExpired,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends SessionFailure {
  const factory _NotFound() = _$NotFoundImpl;
  const _NotFound._() : super._();
}

/// @nodoc
abstract class _$$SessionExpiredImplCopyWith<$Res> {
  factory _$$SessionExpiredImplCopyWith(_$SessionExpiredImpl value,
          $Res Function(_$SessionExpiredImpl) then) =
      __$$SessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionExpiredImplCopyWithImpl<$Res>
    extends _$SessionFailureCopyWithImpl<$Res, _$SessionExpiredImpl>
    implements _$$SessionExpiredImplCopyWith<$Res> {
  __$$SessionExpiredImplCopyWithImpl(
      _$SessionExpiredImpl _value, $Res Function(_$SessionExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionExpiredImpl extends _SessionExpired {
  const _$SessionExpiredImpl() : super._();

  @override
  String toString() {
    return 'SessionFailure.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) databaseError,
    required TResult Function() notFound,
    required TResult Function() sessionExpired,
    required TResult Function() unknownError,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? databaseError,
    TResult? Function()? notFound,
    TResult? Function()? sessionExpired,
    TResult? Function()? unknownError,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? databaseError,
    TResult Function()? notFound,
    TResult Function()? sessionExpired,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class _SessionExpired extends SessionFailure {
  const factory _SessionExpired() = _$SessionExpiredImpl;
  const _SessionExpired._() : super._();
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$SessionFailureCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnknownErrorImpl extends _UnknownError {
  const _$UnknownErrorImpl() : super._();

  @override
  String toString() {
    return 'SessionFailure.unknownError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) databaseError,
    required TResult Function() notFound,
    required TResult Function() sessionExpired,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? databaseError,
    TResult? Function()? notFound,
    TResult? Function()? sessionExpired,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? databaseError,
    TResult Function()? notFound,
    TResult Function()? sessionExpired,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError extends SessionFailure {
  const factory _UnknownError() = _$UnknownErrorImpl;
  const _UnknownError._() : super._();
}
