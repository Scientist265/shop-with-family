import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/entities/cart_item.dart';
import '../../domain/failures/cart_failure.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {

  final List<CartItem> _cartItems = [];

  @override
  Future<Either<CartFailure, Unit>> addItem(String sessionId, CartItem item) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300)); 
      _cartItems.add(item);
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
    return Stream.fromFuture(getCartItems()).asyncMap(
      (either) => either.fold((_) => [], (items) => items),
    );
  }
  
  @override
  Future<Either<CartFailure, Unit>> completeSession(String sessionId) {
  throw UnimplementedError();
  }
}