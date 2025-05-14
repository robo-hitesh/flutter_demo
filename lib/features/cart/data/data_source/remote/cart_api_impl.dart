import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/cart/data/data_source/remote/cart_api.dart';
import 'package:flutter_assignment/features/cart/data/model/cart_model.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class CartApiImpl implements CartApi {
  CartApiImpl({required this.networkService});

  NetworkService networkService;

  @override
  Future<ApiResponse<CartModel>> fetchCart(String cartId) async {
    try {
      final response = await networkService.get(
        url: ApiPath.carts + '/${cartId}',
      );
      return ApiResponse(
        data: CartModel.fromJson(response.data as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }
}
