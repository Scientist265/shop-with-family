// lib/domain/failures/cart_failure.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_failure.freezed.dart';

@freezed
class CartFailure with _$CartFailure {
  const CartFailure._();
    const factory CartFailure.databaseError() = _DatabaseError;

  const factory CartFailure.sessionExpired() = _SessionExpired;
  const factory CartFailure.permissionDenied() = _PermissionDenied;
  const factory CartFailure.itemNotAdded() = _ItemNotAdded;
  const factory CartFailure.cartNotLoaded() = _CartNotLoaded;
  const factory CartFailure.unknownError() = _UnknownError;

  String get message => when(
        databaseError: () => 'Database error occurred',
        sessionExpired: () => 'Session has expired',
        permissionDenied: () => 'You dont have permission',
        itemNotAdded: () => 'Failed to add item',
        cartNotLoaded: () => 'Failed to load cart',
        unknownError: () => 'An unknown error occurred',
      );
}