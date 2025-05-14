import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/add_product/data/data_source/remote/add_product_api.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class AddProductApiImpl extends AddProductApi {
  AddProductApiImpl({required this.networkService});
  NetworkService networkService;
  @override
  Future<ApiResponse<Product>> addProduct(Product product) async {
    try {
      final response = await networkService.post(
        url: ApiPath.apiProductList,
        data: product.toJson(),
      );
      return ApiResponse(
        data: Product.fromJson(response.data as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }
}
