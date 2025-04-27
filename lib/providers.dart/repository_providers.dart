// lib/providers/repository_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sippylife_assesment/data/repositories/product_repository_impl.dart';

// lib/providers/repository_providers.dart
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl();
});
