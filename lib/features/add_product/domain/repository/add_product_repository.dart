import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddProductRepository {
  Future<Either<NetworkException, ApiResponse<Product>>> addProduct(
    Product product,
  );
}
