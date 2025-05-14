import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/cart/data/model/cart_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class CartRepository {
  Future<Either<NetworkException, ApiResponse<CartModel>>> fetchCart(
    String cartId,
  );
}
