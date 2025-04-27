// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFailure,
    required TResult Function() notFound,
    required TResult Function() networkError,
    required TResult Function() unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFailure,
    TResult? Function()? notFound,
    TResult? Function()? networkError,
    TResult? Function()? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFailure,
    TResult Function()? notFound,
    TResult Function()? networkError,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_UnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_UnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFailureCopyWith<$Res> {
  factory $ProductFailureCopyWith(
          ProductFailure value, $Res Function(ProductFailure) then) =
      _$ProductFailureCopyWithImpl<$Res, ProductFailure>;
}

/// @nodoc
class _$ProductFailureCopyWithImpl<$Res, $Val extends ProductFailure>
    implements $ProductFailureCopyWith<$Res> {
  _$ProductFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$ProductFailureCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl() : super._();

  @override
  String toString() {
    return 'ProductFailure.loadFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFailure,
    required TResult Function() notFound,
    required TResult Function() networkError,
    required TResult Function() unknownError,
  }) {
    return loadFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFailure,
    TResult? Function()? notFound,
    TResult? Function()? networkError,
    TResult? Function()? unknownError,
  }) {
    return loadFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFailure,
    TResult Function()? notFound,
    TResult Function()? networkError,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends ProductFailure {
  const factory _LoadFailure() = _$LoadFailureImpl;
  const _LoadFailure._() : super._();
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$ProductFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'ProductFailure.notFound()';
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
    required TResult Function() loadFailure,
    required TResult Function() notFound,
    required TResult Function() networkError,
    required TResult Function() unknownError,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFailure,
    TResult? Function()? notFound,
    TResult? Function()? networkError,
    TResult? Function()? unknownError,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFailure,
    TResult Function()? notFound,
    TResult Function()? networkError,
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
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends ProductFailure {
  const factory _NotFound() = _$NotFoundImpl;
  const _NotFound._() : super._();
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$ProductFailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NetworkErrorImpl extends _NetworkError {
  const _$NetworkErrorImpl() : super._();

  @override
  String toString() {
    return 'ProductFailure.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadFailure,
    required TResult Function() notFound,
    required TResult Function() networkError,
    required TResult Function() unknownError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFailure,
    TResult? Function()? notFound,
    TResult? Function()? networkError,
    TResult? Function()? unknownError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFailure,
    TResult Function()? notFound,
    TResult Function()? networkError,
    TResult Function()? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError extends ProductFailure {
  const factory _NetworkError() = _$NetworkErrorImpl;
  const _NetworkError._() : super._();
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$ProductFailureCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnknownErrorImpl extends _UnknownError {
  const _$UnknownErrorImpl() : super._();

  @override
  String toString() {
    return 'ProductFailure.unknownError()';
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
    required TResult Function() loadFailure,
    required TResult Function() notFound,
    required TResult Function() networkError,
    required TResult Function() unknownError,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadFailure,
    TResult? Function()? notFound,
    TResult? Function()? networkError,
    TResult? Function()? unknownError,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadFailure,
    TResult Function()? notFound,
    TResult Function()? networkError,
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
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadFailure value)? loadFailure,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError extends ProductFailure {
  const factory _UnknownError() = _$UnknownErrorImpl;
  const _UnknownError._() : super._();
}
