import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/add_product/data/data_source/remote/add_product_api.dart';
import 'package:flutter_assignment/features/add_product/data/data_source/remote/add_product_api_impl.dart';
import 'package:flutter_assignment/features/add_product/data/repositories/add_product_repository_impl.dart';
import 'package:flutter_assignment/features/add_product/domain/repository/add_product_repository.dart';
import 'package:flutter_assignment/features/add_product/presentation/bloc/add_product_bloc.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

initAddProductInjection() {
  getIt.registerSingleton<AddProductApi>(
    AddProductApiImpl(networkService: getIt<NetworkService>()),
  );

  getIt.registerSingleton<AddProductRepository>(
    AddProductRepositoryImpl(getIt()),
  );

  getIt.registerFactory<AddProductBloc>(() => AddProductBloc(getIt()));
}
