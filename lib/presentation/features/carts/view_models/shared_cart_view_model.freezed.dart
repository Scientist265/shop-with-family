// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_cart_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SharedCartState {
  List<CartItem> get items => throw _privateConstructorUsedError;
  String get hostName => throw _privateConstructorUsedError;
  String? get friendName => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<CartFailure> get failure => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;

  /// Create a copy of SharedCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedCartStateCopyWith<SharedCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedCartStateCopyWith<$Res> {
  factory $SharedCartStateCopyWith(
          SharedCartState value, $Res Function(SharedCartState) then) =
      _$SharedCartStateCopyWithImpl<$Res, SharedCartState>;
  @useResult
  $Res call(
      {List<CartItem> items,
      String hostName,
      String? friendName,
      bool isLoading,
      Option<CartFailure> failure,
      double totalPrice});
}

/// @nodoc
class _$SharedCartStateCopyWithImpl<$Res, $Val extends SharedCartState>
    implements $SharedCartStateCopyWith<$Res> {
  _$SharedCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hostName = null,
    Object? friendName = freezed,
    Object? isLoading = null,
    Object? failure = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
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
              as Option<CartFailure>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SharedCartStateImplCopyWith<$Res>
    implements $SharedCartStateCopyWith<$Res> {
  factory _$$SharedCartStateImplCopyWith(_$SharedCartStateImpl value,
          $Res Function(_$SharedCartStateImpl) then) =
      __$$SharedCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItem> items,
      String hostName,
      String? friendName,
      bool isLoading,
      Option<CartFailure> failure,
      double totalPrice});
}

/// @nodoc
class __$$SharedCartStateImplCopyWithImpl<$Res>
    extends _$SharedCartStateCopyWithImpl<$Res, _$SharedCartStateImpl>
    implements _$$SharedCartStateImplCopyWith<$Res> {
  __$$SharedCartStateImplCopyWithImpl(
      _$SharedCartStateImpl _value, $Res Function(_$SharedCartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SharedCartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hostName = null,
    Object? friendName = freezed,
    Object? isLoading = null,
    Object? failure = null,
    Object? totalPrice = null,
  }) {
    return _then(_$SharedCartStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
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
              as Option<CartFailure>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SharedCartStateImpl implements _SharedCartState {
  const _$SharedCartStateImpl(
      {required final List<CartItem> items,
      required this.hostName,
      required this.friendName,
      required this.isLoading,
      required this.failure,
      this.totalPrice = 0.0})
      : _items = items;

  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String hostName;
  @override
  final String? friendName;
  @override
  final bool isLoading;
  @override
  final Option<CartFailure> failure;
  @override
  @JsonKey()
  final double totalPrice;

  @override
  String toString() {
    return 'SharedCartState(items: $items, hostName: $hostName, friendName: $friendName, isLoading: $isLoading, failure: $failure, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedCartStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.friendName, friendName) ||
                other.friendName == friendName) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      hostName,
      friendName,
      isLoading,
      failure,
      totalPrice);

  /// Create a copy of SharedCartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedCartStateImplCopyWith<_$SharedCartStateImpl> get copyWith =>
      __$$SharedCartStateImplCopyWithImpl<_$SharedCartStateImpl>(
          this, _$identity);
}

abstract class _SharedCartState implements SharedCartState {
  const factory _SharedCartState(
      {required final List<CartItem> items,
      required final String hostName,
      required final String? friendName,
      required final bool isLoading,
      required final Option<CartFailure> failure,
      final double totalPrice}) = _$SharedCartStateImpl;

  @override
  List<CartItem> get items;
  @override
  String get hostName;
  @override
  String? get friendName;
  @override
  bool get isLoading;
  @override
  Option<CartFailure> get failure;
  @override
  double get totalPrice;

  /// Create a copy of SharedCartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedCartStateImplCopyWith<_$SharedCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
