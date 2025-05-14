import 'package:flutter/foundation.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/product_list/data/data_source/remote/product_list_api.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

import '../../../../../core/resources/api_response.dart';
import '../../models/product_model.dart';

class ProductListApiImpl implements ProductListApi {
  ProductListApiImpl({required this.networkService});

  NetworkService networkService;

  @override
  Future<ApiResponse<List<Product>>> fetchProducts() async {
    try {
      final response = await networkService.get(url: ApiPath.apiProductList);
      final data = response.data as List;

      return ApiResponse(
        data: data.map((product) => Product.fromJson(product)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<int>> deleteProduct(int id) async {
    try {
      final response = await networkService.delete(
        url: '${ApiPath.apiProductList}/$id',
      );

      return ApiResponse(
        data: Product.fromJson(response.data as Map<String, dynamic>).id,
      );
    } catch (e) {
      rethrow;
    }
  }
}
