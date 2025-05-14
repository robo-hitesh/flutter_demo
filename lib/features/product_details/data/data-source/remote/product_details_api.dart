import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';

abstract class ProductDetailsApi {
  Future<ApiResponse<Product>> fetchProduct(String productID);
}
