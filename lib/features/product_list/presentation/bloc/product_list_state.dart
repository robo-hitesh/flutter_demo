import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';

abstract class ProductListState {}

class ProductListInitialState extends ProductListState {}

class ProductListLoadingState extends ProductListState {}

class ProductListSuccessState extends ProductListState {
  ProductListSuccessState(this.productList);
  List<Product> productList;
}

class ProductListErrorState extends ProductListState {
  ProductListErrorState(this.message);
  final String message;
}

class ProductDeleteSuccessState extends ProductListState {
  ProductDeleteSuccessState(this.productID);
  final int productID;
}
