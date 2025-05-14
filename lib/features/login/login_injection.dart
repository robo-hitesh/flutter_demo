import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/login/data/data_source/remote/login_api.dart';
import 'package:flutter_assignment/features/login/data/data_source/remote/login_api_impl.dart';
import 'package:flutter_assignment/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/features/login/domain/repository/login_repository.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

Future<void> initLoginInjection() async {
  getIt.registerSingleton<LoginApi>(
    LoginApiImpl(networkService: getIt<NetworkService>()),
  );
  getIt.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(getIt<LoginApi>()),
  );
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));
}
