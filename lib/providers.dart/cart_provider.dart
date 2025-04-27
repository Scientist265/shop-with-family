import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/data/repositories/cart_repository_impl.dart';
import 'package:sippylife_assesment/domain/repositories/cart_repository.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl(); 
});