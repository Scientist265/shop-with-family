
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sippylife_assesment/data/repositories/product_repository_impl.dart';

mixin RemoteDataSource {
  final Dio _dio = Dio();

  Future<Either<FailureType, List<T>>> fetchData<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(endpoint);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return right(data
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList());
      }
      return left(_handleError(response.statusCode));
    } on DioException catch (e) {
      return left(_handleError(e.response?.statusCode));
    } catch (e) {
      return left(FailureType.unknownError());
    }
  }

  FailureType _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return FailureType.badRequest();
      case 401:
        return FailureType.unauthorized();
      case 404:
        return FailureType.notFound();
      case 500:
        return FailureType.serverError();
      default:
        return FailureType.unknownError();
    }
  }
}