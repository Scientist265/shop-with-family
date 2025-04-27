// lib/providers/product_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/data/repositories/product_repository_impl.dart';
import 'package:sippylife_assesment/domain/entities/product.dart';
import 'package:sippylife_assesment/domain/failures/product_failure.dart';
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl();
});

final productListProvider = FutureProvider.autoDispose<Either<ProductFailure, List<Product>>>((ref) {
  return ref.read(productRepositoryProvider).getProducts();
});