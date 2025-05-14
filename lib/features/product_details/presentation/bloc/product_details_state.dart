import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitialState extends ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsSuccessState extends ProductDetailsState {
  ProductDetailsSuccessState(this.productDetails);
  Product productDetails;
}

class ProductDetailsErrorState extends ProductDetailsState {
  ProductDetailsErrorState(this.message);
  final String message;
}
