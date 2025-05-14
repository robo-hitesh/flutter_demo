import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/features/add_product/add_product_injection.dart';
import 'package:flutter_assignment/features/cart/cart_injection.dart';
import 'package:flutter_assignment/features/login/login_injection.dart';
import 'package:flutter_assignment/features/product_details/product_details_injection.dart';
import 'package:flutter_assignment/features/product_list/product_list_injection.dart';
import 'package:flutter_assignment/features/profile/profile_injection.dart';
import 'package:flutter_assignment/features/signup/signup_injection.dart';
import 'package:flutter_assignment/shared/data/services/network_service_impl.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initInjections() async {
  await initCommonInjections();
  await initLoginInjection();
  await initSignupInjection();
  await initProductListInjection();
  await initAddProductInjection();
  await initProductDetailsInjection();
  await initCartInjection();
  await initProfileInjection();
}

Future<void> initCommonInjections() async {
  getIt.registerLazySingleton<NetworkService>(() {
    final dio = Dio();
    dio.options.baseUrl = "https://fakestoreapi.com";
    final networkService = NetworkServiceImpl(dio);
    return networkService;
  });
}
