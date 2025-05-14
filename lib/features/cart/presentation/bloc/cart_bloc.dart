import 'package:flutter_assignment/features/cart/data/model/cart_model.dart';
import 'package:flutter_assignment/features/cart/domain/repository/cart_repository.dart';
import 'package:flutter_assignment/features/cart/presentation/bloc/cart_event.dart';
import 'package:flutter_assignment/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this.cartRepository) : super(CartInitialState()) {
    on<CartFetchEvent>(_fetchCart);
  }

  final CartRepository cartRepository;

  Future<void> _fetchCart(
    CartFetchEvent event,
    Emitter<CartState> state,
  ) async {
    emit(CartLoadingState());
    final result = await cartRepository.fetchCart(event.cartId);
    result.fold(
      (left) =>
          emit(CartErrorState(left.errorMessage ?? "Failed to load Product")),
      (right) => emit(
        CartSuccessState(
          right.data ?? CartModel(id: 0, userId: 0, date: '', products: []),
        ),
      ),
    );
  }
}
