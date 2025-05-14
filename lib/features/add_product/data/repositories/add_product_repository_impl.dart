import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/add_product/data/data_source/remote/add_product_api.dart';
import 'package:flutter_assignment/features/add_product/domain/repository/add_product_repository.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:fpdart/fpdart.dart';

class AddProductRepositoryImpl extends AddProductRepository {
  AddProductRepositoryImpl(this.addProductApi);
  AddProductApi addProductApi;
  @override
  Future<Either<NetworkException, ApiResponse<Product>>> addProduct(
    Product product,
  ) async {
    try {
      final result = await addProductApi.addProduct(product);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
