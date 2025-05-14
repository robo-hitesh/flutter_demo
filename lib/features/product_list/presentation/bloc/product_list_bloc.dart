import 'package:flutter_assignment/features/product_list/domain/repositories/product_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(this.productListRepository)
    : super(ProductListInitialState()) {
    on<ProductListFetchEvent>(_fetchProductList);
    on<DeleteProductEvent>(_deleteProduct);
  }

  final ProductListRepository productListRepository;

  Future<void> _fetchProductList(
    ProductListFetchEvent event,
    Emitter<ProductListState> state,
  ) async {
    emit(ProductListLoadingState());
    final result = await productListRepository.productList();
    result.fold(
      (left) => emit(ProductListErrorState(left.errorMessage ?? "")),
      (right) => emit(ProductListSuccessState(right.data ?? [])),
    );
  }

  Future<void> _deleteProduct(
    DeleteProductEvent event,
    Emitter<ProductListState> state,
  ) async {
    emit(ProductListLoadingState());

    final result = await productListRepository.deleteProduct(event.productID);
    result.fold(
      (left) => emit(ProductListErrorState(left.errorMessage ?? "")),
      (right) {
        emit(ProductDeleteSuccessState(right.data ?? 0));
        add(ProductListFetchEvent());
      },
    );
  }
}
