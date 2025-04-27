// lib/domain/failures/product_failure.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_failure.freezed.dart';

@freezed
class ProductFailure with _$ProductFailure {
  const ProductFailure._();
  const factory ProductFailure.loadFailure() = _LoadFailure;
  const factory ProductFailure.notFound() = _NotFound;
  const factory ProductFailure.networkError() = _NetworkError;
  const factory ProductFailure.unknownError() = _UnknownError;

  String get message => when(
        loadFailure: () => 'Failed to load products',
        notFound: () => 'Products not found',
        networkError: () => 'Network connection failed',
        unknownError: () => 'An unknown error occurred',
      );
}