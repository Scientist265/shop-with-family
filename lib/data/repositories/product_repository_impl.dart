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
    final brands = [
      'Coca Cola',
      'Pepsi',
      'Sprite',
      'Fanta',
      'Maltina',
      'Five Alive',
      'Lipton',
      'Chivita',
      'Ribena',
      'Nestlé Pure Life',
    ];
    final types = [
      'Soda',
      'Juice',
      'Water',
      'Energy Drink',
      'Tea',
      'Smoothie',
      'Yoghurt',
    ];
    final flavors = [
      'Orange',
      'Lemon',
      'Strawberry',
      'Apple',
      'Grape',
      'Pineapple',
      'Mint',
    ];

    return '${_random.element(brands)} ${_random.element(flavors)} ${_random.element(types)}';
  }

  String _generateImageUrl() {
    final imageUrls = [
      'https://archive.businessday.ng/wp-content/uploads/2016/02/coke-can.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLdBq-50cnfATLr5p1URwoDi14vo7hM7WJ0A&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9E0J1YUyEdu2y8jye_K56HttJVsXrPdOs_A&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAfOxFMcJXNh96ado5vNTrguj9Cw0Eg6rk_w&s',
      'https://rukminim2.flixcart.com/image/850/1000/xif0q/glass/1/h/t/juice-glass-set-of-12-drinking-water-glasses-long-juice-highball-original-imagh3z6czwvabjc.jpeg?q=20&crop=false', // Juice glass
      'https://www.nbplc.com/storage/2021/11/malt-2-min-1.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgkUhAYYKmWWsNpiLKsjszAJCqe-HrFMJkMg&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhH5XEOA_Tlgnm1ejA2lTFqc6TXmIXzglIgg&s',
      'https://addide.com/cdn/shop/products/cr-ribena-blackcurrant-125ml-1_1_copy.jpg?v=1632144014',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTK9teOHa97o7XdQVphNG9uU7zJBB48WEiYQ&s',
    ];

    return _random.element(imageUrls);
  }
}

abstract class ProductRepository {
  Future<Either<ProductFailure, List<Product>>> getProducts();
}
