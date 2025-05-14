import 'package:flutter_assignment/features/cart/data/model/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  CartSuccessState(this.cartModel);
  CartModel cartModel;
}

class CartErrorState extends CartState {
  CartErrorState(this.message);
  final String message;
}
