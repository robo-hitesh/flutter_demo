import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/login/data/data_source/remote/login_api.dart';
import 'package:flutter_assignment/features/login/data/models/login_response.dart';
import 'package:flutter_assignment/features/login/domain/repository/login_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this.loginApi);
  LoginApi loginApi;

  @override
  Future<Either<NetworkException, ApiResponse<LoginResponse>>> login(
    String userName,
    String password,
  ) async {
    try {
      final response = await loginApi.loginUser(userName, password);
      FlutterSecureStorage().write(key: "token", value: response.data?.token);
      return Right(response);
    } on DioException catch (e) {
      return Left(NetworkException(requestOptions: e.requestOptions));
    }
  }
}
