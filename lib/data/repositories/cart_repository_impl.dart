import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/entities/cart_item.dart';
import '../../domain/failures/cart_failure.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _cartItems = [];
  final _controller = StreamController<List<CartItem>>.broadcast();

  @override
  Future<Either<CartFailure, Unit>> addItem(
    String sessionId,
    CartItem newItem,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final existingIndex = _cartItems.indexWhere(
        (item) => item.product.id == newItem.product.id,
      );

      if (existingIndex != -1) {
        final existingItem = _cartItems[existingIndex];
        final updatedItem = existingItem.copyWith(
          quantity: existingItem.quantity + newItem.quantity,
        );
        _cartItems[existingIndex] = updatedItem;
      } else {
        _cartItems.add(newItem);
      }

      _controller.add(List.from(_cartItems));
      return right(unit);
    } catch (e) {
      return left(const CartFailure.itemNotAdded());
    }
  }

  @override
  Future<Either<CartFailure, List<CartItem>>> getCartItems() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      return right(_cartItems);
    } catch (e) {
      return left(const CartFailure.cartNotLoaded());
    }
  }

  @override
  Stream<List<CartItem>> watchCartItems(String sessionId) {
    return _controller.stream;
  }

  @override
  Future<Either<CartFailure, Unit>> completeSession(String sessionId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      _cartItems.clear();
      _controller.add(_cartItems);
      return right(unit);
    } catch (e) {
      return left(const CartFailure.unknownError());
    }
  }
}
