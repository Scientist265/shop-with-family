import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sippylife_assesment/domain/failures/product_failure.dart';
import 'package:sippylife_assesment/mixin/remote_mixin.dart';
import '../../domain/entities/product.dart';

part 'product_repository_impl.freezed.dart';
// class ProductRepositoryImpl implements ProductRepository {
//   final List<Product> _predefinedProducts = [
//     Product(
//       id: '1',
//       name: 'Coca Cola Classic',
//       price: 2.99,
//       imageUrl:
//           'https://archive.businessday.ng/wp-content/uploads/2016/02/coke-can.jpg',
//     ),
//     Product(
//       id: '2',
//       name: 'Pepsi Cola',
//       price: 2.89,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLdBq-50cnfATLr5p1URwoDi14vo7hM7WJ0A&s',
//     ),
//     Product(
//       id: '3',
//       name: 'Sprite Lemon-Lime',
//       price: 2.79,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9E0J1YUyEdu2y8jye_K56HttJVsXrPdOs_A&s',
//     ),
//     Product(
//       id: '4',
//       name: 'Fanta Orange',
//       price: 2.69,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAfOxFMcJXNh96ado5vNTrguj9Cw0Eg6rk_w&s',
//     ),
//     Product(
//       id: '5',
//       name: 'Maltina Classic',
//       price: 3.49,
//       imageUrl: 'https://www.nbplc.com/storage/2021/11/malt-2-min-1.png',
//     ),
//     Product(
//       id: '6',
//       name: 'Five Alive Citrus',
//       price: 3.99,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgkUhAYYKmWWsNpiLKsjszAJCqe-HrFMJkMg&s',
//     ),
//     Product(
//       id: '7',
//       name: 'Lipton Ice Tea',
//       price: 2.99,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhH5XEOA_Tlgnm1ejA2lTFqc6TXmIXzglIgg&s',
//     ),
//     Product(
//       id: '8',
//       name: 'Chivita Orange Juice',
//       price: 4.49,
//       imageUrl:
//           'https://addide.com/cdn/shop/products/cr-ribena-blackcurrant-125ml-1_1_copy.jpg?v=1632144014',
//     ),
//     Product(
//       id: '9',
//       name: 'Ribena Blackcurrant',
//       price: 3.99,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTK9teOHa97o7XdQVphNG9uU7zJBB48WEiYQ&s',
//     ),
//     Product(
//       id: '10',
//       name: 'Nestlé Pure Life Water',
//       price: 1.99,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3yK7kHpI8w-6qJ9Z7v7n7VjJ7X9Z7XjHjqA&s',
//     ),
//   ];

//   @override
//   Future<Either<ProductFailure, List<Product>>> getProducts() async {
//     try {
//       await Future.delayed(const Duration(seconds: 1));
//       return right(List.from(_predefinedProducts));
//     } catch (e) {
//       return left(const ProductFailure.unknownError());
//     }
//   }
// }

@freezed
class FailureType with _$FailureType {
  const factory FailureType.badRequest() = _BadRequest;
  const factory FailureType.unauthorized() = _Unauthorized;
  const factory FailureType.notFound() = _NotFound;
  const factory FailureType.serverError() = _ServerError;
  const factory FailureType.unknownError() = _UnknownError;
}

class ProductRepositoryImpl with RemoteDataSource implements ProductRepository {
  @override
  Future<Either<ProductFailure, List<Product>>> getProducts() async {
    const endpoint = 'http://127.0.0.1:5500/api/products.json';

    final result = await fetchData<Product>(
      endpoint: endpoint,
      fromJson: Product.fromJson,
    );

    return result.fold(
      (failure) => left(_mapFailure(failure)),
      (products) => right(products),
    );
  }

  ProductFailure _mapFailure(FailureType failure) {
    return failure.when(
      badRequest: () => const ProductFailure.networkError(),
      unauthorized: () => const ProductFailure.networkError(),
      notFound: () => const ProductFailure.networkError(),
      serverError: () => const ProductFailure.networkError(),
      unknownError: () => const ProductFailure.unknownError(),
    );
  }
}

abstract class ProductRepository {
  Future<Either<ProductFailure, List<Product>>> getProducts();
}
