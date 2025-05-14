import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/profile/data/data_source/profile_api.dart';
import 'package:flutter_assignment/features/profile/data/data_source/profile_api_impl.dart';
import 'package:flutter_assignment/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_assignment/features/profile/domain/repository/profile_repository.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

initProfileInjection() {
  getIt.registerSingleton<ProfileApi>(
    ProfileApiImpl(networkService: getIt<NetworkService>()),
  );

  getIt.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(getIt()));

  getIt.registerFactory<ProfileBloc>(() => ProfileBloc(getIt()));
}
