import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/cart/data/model/cart_model.dart';

abstract class CartApi {
  Future<ApiResponse<CartModel>> fetchCart(String cartId);
}
