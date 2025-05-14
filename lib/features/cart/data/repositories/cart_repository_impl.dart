import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/cart/data/data_source/remote/cart_api.dart';
import 'package:flutter_assignment/features/cart/data/model/cart_model.dart';
import 'package:flutter_assignment/features/cart/domain/repository/cart_repository.dart';
import 'package:fpdart/fpdart.dart';

class CartRepositoryImpl extends CartRepository {
  CartRepositoryImpl(this.cartApi);
  CartApi cartApi;

  @override
  Future<Either<NetworkException, ApiResponse<CartModel>>> fetchCart(
    String cartId,
  ) async {
    try {
      final result = await cartApi.fetchCart(cartId);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
