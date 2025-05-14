import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/product_details/data/data-source/remote/product_details_api.dart';
import 'package:flutter_assignment/features/product_details/data/data-source/remote/product_details_api_impl.dart';
import 'package:flutter_assignment/features/product_details/data/repositories/product_details_repository_impl.dart';
import 'package:flutter_assignment/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:flutter_assignment/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

initProductDetailsInjection() {
  getIt.registerSingleton<ProductDetailsApi>(
    ProductDetailsApiImpl(networkService: getIt<NetworkService>()),
  );

  getIt.registerSingleton<ProductDetailsRepository>(
    ProductDetailsRepositoryImpl(getIt()),
  );

  getIt.registerFactory<ProductDetailsBloc>(() => ProductDetailsBloc(getIt()));
}
