import 'package:equatable/equatable.dart';

class AddProductState extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String? category;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const AddProductState({
    this.id = 0,
    this.title = '',
    this.price = 0.0,
    this.description = '',
    this.category,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  AddProductState copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return AddProductState(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    isLoading,
    isSuccess,
    errorMessage,
  ];
}
