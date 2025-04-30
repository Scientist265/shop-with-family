// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionState {
  String? get sessionId => throw _privateConstructorUsedError;
  String? get hostName => throw _privateConstructorUsedError;
  String? get friendName => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<SessionFailure> get failure => throw _privateConstructorUsedError;
  bool get canJoin => throw _privateConstructorUsedError;
  bool get isJoined => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call(
      {String? sessionId,
      String? hostName,
      String? friendName,
      bool isLoading,
      Option<SessionFailure> failure,
      bool canJoin,
      bool isJoined,
      List<String> participants});
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? hostName = freezed,
    Object? friendName = freezed,
    Object? isLoading = null,
    Object? failure = null,
    Object? canJoin = null,
    Object? isJoined = null,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      friendName: freezed == friendName
          ? _value.friendName
          : friendName // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<SessionFailure>,
      canJoin: null == canJoin
          ? _value.canJoin
          : canJoin // ignore: cast_nullable_to_non_nullable
              as bool,
      isJoined: null == isJoined
          ? _value.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionStateImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateImplCopyWith(
          _$SessionStateImpl value, $Res Function(_$SessionStateImpl) then) =
      __$$SessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sessionId,
      String? hostName,
      String? friendName,
      bool isLoading,
      Option<SessionFailure> failure,
      bool canJoin,
      bool isJoined,
      List<String> participants});
}

/// @nodoc
class __$$SessionStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateImpl>
    implements _$$SessionStateImplCopyWith<$Res> {
  __$$SessionStateImplCopyWithImpl(
      _$SessionStateImpl _value, $Res Function(_$SessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? hostName = freezed,
    Object? friendName = freezed,
    Object? isLoading = null,
    Object? failure = null,
    Object? canJoin = null,
    Object? isJoined = null,
    Object? participants = null,
  }) {
    return _then(_$SessionStateImpl(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      friendName: freezed == friendName
          ? _value.friendName
          : friendName // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<SessionFailure>,
      canJoin: null == canJoin
          ? _value.canJoin
          : canJoin // ignore: cast_nullable_to_non_nullable
              as bool,
      isJoined: null == isJoined
          ? _value.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SessionStateImpl implements _SessionState {
  const _$SessionStateImpl(
      {required this.sessionId,
      required this.hostName,
      required this.friendName,
      required this.isLoading,
      required this.failure,
      required this.canJoin,
      required this.isJoined,
      required final List<String> participants})
      : _participants = participants;

  @override
  final String? sessionId;
  @override
  final String? hostName;
  @override
  final String? friendName;
  @override
  final bool isLoading;
  @override
  final Option<SessionFailure> failure;
  @override
  final bool canJoin;
  @override
  final bool isJoined;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'SessionState(sessionId: $sessionId, hostName: $hostName, friendName: $friendName, isLoading: $isLoading, failure: $failure, canJoin: $canJoin, isJoined: $isJoined, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.friendName, friendName) ||
                other.friendName == friendName) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.canJoin, canJoin) || other.canJoin == canJoin) &&
            (identical(other.isJoined, isJoined) ||
                other.isJoined == isJoined) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      hostName,
      friendName,
      isLoading,
      failure,
      canJoin,
      isJoined,
      const DeepCollectionEquality().hash(_participants));

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      __$$SessionStateImplCopyWithImpl<_$SessionStateImpl>(this, _$identity);
}

abstract class _SessionState implements SessionState {
  const factory _SessionState(
      {required final String? sessionId,
      required final String? hostName,
      required final String? friendName,
      required final bool isLoading,
      required final Option<SessionFailure> failure,
      required final bool canJoin,
      required final bool isJoined,
      required final List<String> participants}) = _$SessionStateImpl;

  @override
  String? get sessionId;
  @override
  String? get hostName;
  @override
  String? get friendName;
  @override
  bool get isLoading;
  @override
  Option<SessionFailure> get failure;
  @override
  bool get canJoin;
  @override
  bool get isJoined;
  @override
  List<String> get participants;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
