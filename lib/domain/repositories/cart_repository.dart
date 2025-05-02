import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/entities/cart_item.dart';
import '../failures/cart_failure.dart';

abstract class CartRepository {
  Future<Either<CartFailure, Unit>> addItem(String sessionId, CartItem item);
  Future<Either<CartFailure, Unit>> completeSession(String sessionId);
  Stream<List<CartItem>> watchCartItems(String sessionId);
}
