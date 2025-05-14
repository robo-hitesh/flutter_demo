import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/product_details/data/data-source/remote/product_details_api.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class ProductDetailsApiImpl extends ProductDetailsApi {
  ProductDetailsApiImpl({required this.networkService});

  NetworkService networkService;

  @override
  Future<ApiResponse<Product>> fetchProduct(String productID) async {
    try {
      final response = await networkService.get(
        url: ApiPath.apiProductList + '/$productID',
      );
      return ApiResponse(
        data: Product.fromJson(response.data as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }
}
