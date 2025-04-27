// lib/data/repositories/firebase_cart_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/entities/cart_item.dart';
import 'package:sippylife_assesment/domain/failures/cart_failure.dart';
import 'package:sippylife_assesment/domain/repositories/cart_repository.dart';

class FirebaseCartRepository implements CartRepository {
  final FirebaseFirestore _firestore;

  FirebaseCartRepository() : _firestore = FirebaseFirestore.instance {
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  @override
  Future<Either<CartFailure, Unit>> addItem(
    String sessionId,
    CartItem item,
  ) async {
    try {
      await _firestore
          .collection('sessions')
          .doc(sessionId)
          .collection('cart')
          .doc(item.product.id)
          .set(item.toJson());
      return right(unit);
    } catch (e) {
      return left(const CartFailure.databaseError());
    }
  }

  @override
  Future<Either<CartFailure, Unit>> completeSession(String sessionId) async {
    try {
      await _firestore.collection('sessions').doc(sessionId).update({
        'isActive': false,
        'completedAt': FieldValue.serverTimestamp(),
      });
      return right(unit);
    } catch (e) {
      return left(const CartFailure.databaseError());
    }
  }

  @override
  Stream<List<CartItem>> watchCartItems(String sessionId) {
    return _firestore
        .collection('sessions')
        .doc(sessionId)
        .collection('cart')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => CartItem.fromJson(doc.data()))
                  .toList(),
        );
  }
}
