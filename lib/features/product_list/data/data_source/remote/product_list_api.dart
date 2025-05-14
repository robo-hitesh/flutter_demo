import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';

abstract class ProductListApi {
  Future<ApiResponse<List<Product>>> fetchProducts();
  Future<ApiResponse<int>> deleteProduct(int id);
}
