import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/domain/failures/product_failure.dart';
import '../../domain/entities/product.dart';
import 'package:faker/faker.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RandomGenerator _random = RandomGenerator();

  @override
  Future<Either<ProductFailure, List<Product>>> getProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      if (_random.decimal(scale: 1) < 0.1) {
        return left(const ProductFailure.networkError());
      }

      return right(_generateProducts());
    } catch (e) {
      return left(const ProductFailure.unknownError());
    }
  }

  List<Product> _generateProducts() {
    return List.generate(15, (index) {
      final productName = _generateProductName();
      final price = _random.decimal(scale: 99, min: 5);

      return Product(
        id: '${index + 1}',
        name: productName,
        price: double.parse(price.toStringAsFixed(2)),
        imageUrl: _generateImageUrl(),
      );
    });
  }

  String _generateProductName() {
    final types = ['T-Shirt', 'Jeans', 'Sneakers', 'Jacket', 'Hat', 'Watch'];
    final adjectives = ['Premium', 'Sport', 'Classic', 'Modern', 'Vintage'];
    final colors = ['Black', 'White', 'Blue', 'Red', 'Green'];

    return '${_random.element(adjectives)} ${_random.element(colors)} ${_random.element(types)}';
  }

  String _generateImageUrl() {
    return 'https://t4.ftcdn.net/jpg/02/84/65/61/360_F_284656117_sPF8gVWaX627bq5qKrlrvCz1eFfowdBf.jpg';
  }
}

abstract class ProductRepository {
  Future<Either<ProductFailure, List<Product>>> getProducts();
}
