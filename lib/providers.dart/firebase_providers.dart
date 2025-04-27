// Firebase providers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/data/repositories/firebase_cart_repository.dart';
import 'package:sippylife_assesment/domain/repositories/cart_repository.dart';
import 'package:sippylife_assesment/presentation/features/carts/view_models/shared_cart_view_model.dart';

final firestoreProvider = Provider<FirebaseFirestore>(
  (_) => FirebaseFirestore.instance,
);

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return FirebaseCartRepository();
});

final sharedCartViewModelProvider =
    StateNotifierProvider.family<SharedCartViewModel, SharedCartState, String>((
      ref,
      sessionId,
    ) {
      return SharedCartViewModel(ref.watch(cartRepositoryProvider), sessionId);
    });
