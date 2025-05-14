import 'dart:async';

import 'package:flutter_assignment/features/add_product/domain/repository/add_product_repository.dart';
import 'package:flutter_assignment/features/add_product/presentation/bloc/add_product_event.dart';
import 'package:flutter_assignment/features/add_product/presentation/bloc/add_product_state.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc(this.addProductRepository) : super(AddProductState()) {
    on<ProductSubmitted>(_addProduct);
    on<ProductTitleChanged>(_onTitleChanged);
    on<ProductPriceChanged>(_onPriceChanged);
    on<ProductDescriptionChanged>(_onDescriptionChanged);
    on<ProductCategoryChanged>(_onCategoryChanged);
  }

  final AddProductRepository addProductRepository;

  Future<void> _addProduct(
    AddProductEvent event,
    Emitter<AddProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await addProductRepository.addProduct(
      Product(
        id: 0,
        title: state.title,
        price: state.price,
        description: state.description,
        category: state.category,
        image: '',
      ),
    );
    result.fold(
      (left) => emit(
        state.copyWith(
          isSuccess: false,
          errorMessage: left.errorMessage ?? "Failed to add Product",
        ),
      ),
      (right) => emit(
        state.copyWith(
          isSuccess: true,
          errorMessage: null,
          title: right.data?.title,
          price: right.data?.price,
          description: right.data?.description,
        ),
      ),
    );
  }

  FutureOr<void> _onTitleChanged(
    ProductTitleChanged event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  FutureOr<void> _onPriceChanged(
    ProductPriceChanged event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(price: event.price));
  }

  FutureOr<void> _onDescriptionChanged(
    ProductDescriptionChanged event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  FutureOr<void> _onCategoryChanged(
    ProductCategoryChanged event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(category: event.category));
  }
}
