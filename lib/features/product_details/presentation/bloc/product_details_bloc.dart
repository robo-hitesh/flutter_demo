import 'package:flutter_assignment/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:flutter_assignment/features/product_details/presentation/bloc/product_details_event.dart';
import 'package:flutter_assignment/features/product_details/presentation/bloc/product_details_state.dart';
import 'package:flutter_assignment/features/product_list/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this.productDetailsRepository)
    : super(ProductDetailsInitialState()) {
    on<ProductDetailsFetchEvent>(_fetchProductDetails);
  }

  final ProductDetailsRepository productDetailsRepository;

  Future<void> _fetchProductDetails(
    ProductDetailsFetchEvent event,
    Emitter<ProductDetailsState> state,
  ) async {
    emit(ProductDetailsLoadingState());
    final result = await productDetailsRepository.fetchProductDetails(
      event.productID,
    );
    result.fold(
      (left) => emit(
        ProductDetailsErrorState(left.errorMessage ?? "Failed to load Product"),
      ),
      (right) => emit(
        ProductDetailsSuccessState(
          right.data ??
              Product(id: 0, title: "", image: "", price: 0.0, description: ''),
        ),
      ),
    );
  }
}
