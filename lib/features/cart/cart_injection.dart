import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/cart/data/data_source/remote/cart_api.dart';
import 'package:flutter_assignment/features/cart/data/data_source/remote/cart_api_impl.dart';
import 'package:flutter_assignment/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:flutter_assignment/features/cart/domain/repository/cart_repository.dart';
import 'package:flutter_assignment/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

initCartInjection() {
  getIt.registerSingleton<CartApi>(
    CartApiImpl(networkService: getIt<NetworkService>()),
  );

  getIt.registerSingleton<CartRepository>(CartRepositoryImpl(getIt()));

  getIt.registerFactory<CartBloc>(() => CartBloc(getIt()));
}
