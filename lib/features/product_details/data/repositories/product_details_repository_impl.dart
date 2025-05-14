import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/product_details/data/data-source/remote/product_details_api.dart';
import 'package:flutter_assignment/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:fpdart/fpdart.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  ProductDetailsRepositoryImpl(this.productDetailsApi);
  ProductDetailsApi productDetailsApi;

  @override
  Future<Either<NetworkException, ApiResponse<Product>>> fetchProductDetails(
    String productId,
  ) async {
    try {
      final result = await productDetailsApi.fetchProduct(productId);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
