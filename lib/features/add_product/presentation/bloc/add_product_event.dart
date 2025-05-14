import 'package:equatable/equatable.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class ProductTitleChanged extends AddProductEvent {
  final String title;

  const ProductTitleChanged(this.title);

  @override
  List<Object> get props => [title];
}

class ProductPriceChanged extends AddProductEvent {
  final double price;

  const ProductPriceChanged(this.price);

  @override
  List<Object> get props => [price];
}

class ProductDescriptionChanged extends AddProductEvent {
  final String description;

  const ProductDescriptionChanged(this.description);

  @override
  List<Object> get props => [description];
}

class ProductCategoryChanged extends AddProductEvent {
  final String category;

  const ProductCategoryChanged(this.category);

  @override
  List<Object> get props => [category];
}

class ProductSubmitted extends AddProductEvent {
  const ProductSubmitted();
}
