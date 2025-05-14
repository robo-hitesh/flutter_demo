import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/product_list/data/data_source/remote/product_list_api.dart';
import 'package:flutter_assignment/features/product_list/data/data_source/remote/product_list_api_impl.dart';
import 'package:flutter_assignment/features/product_list/data/repositories/product_list_repository_impl.dart';
import 'package:flutter_assignment/features/product_list/domain/repositories/product_list_repository.dart';
import 'package:flutter_assignment/features/product_list/presentation/bloc/product_list_bloc.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

initProductListInjection() {
  getIt.registerSingleton<ProductListApi>(
    ProductListApiImpl(networkService: getIt<NetworkService>()),
  );
  getIt.registerSingleton<ProductListRepository>(
    ProductListRepositoryImpl(getIt()),
  );
  getIt.registerFactory<ProductListBloc>(() => ProductListBloc(getIt()));
}
