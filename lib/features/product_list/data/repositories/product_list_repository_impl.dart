import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/product_list/data/data_source/remote/product_list_api.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:flutter_assignment/features/product_list/domain/repositories/product_list_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductListRepositoryImpl extends ProductListRepository {
  ProductListRepositoryImpl(this.productListApi);

  ProductListApi productListApi;

  @override
  Future<Either<NetworkException, ApiResponse<List<Product>>>>
  productList() async {
    try {
      final result = await productListApi.fetchProducts();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, ApiResponse<int>>> deleteProduct(
    int id,
  ) async {
    try {
      final result = await productListApi.deleteProduct(id);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
