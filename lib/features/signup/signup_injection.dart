import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/signup/data/data_source/remote/singup_api.dart';
import 'package:flutter_assignment/features/signup/data/data_source/remote/singup_api_impl.dart';
import 'package:flutter_assignment/features/signup/data/repositories/signup_up_repository_impl.dart';
import 'package:flutter_assignment/features/signup/domain/repository/signup_repository.dart';
import 'package:flutter_assignment/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

Future<void> initSignupInjection() async {
  getIt.registerSingleton<SingupApi>(
    SingupApiImpl(networkService: getIt<NetworkService>()),
  );
  getIt.registerSingleton<SignupRepository>(
    SignupUpRepositoryImpl(getIt<SingupApi>()),
  );
  getIt.registerFactory<SignupBloc>(() => SignupBloc(getIt()));
}
