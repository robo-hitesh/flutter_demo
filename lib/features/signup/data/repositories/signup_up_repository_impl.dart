import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/signup/data/data_source/remote/singup_api.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_request.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_response.dart';
import 'package:flutter_assignment/features/signup/domain/repository/signup_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignupUpRepositoryImpl extends SignupRepository {
  SignupUpRepositoryImpl(this.singupApi);
  SingupApi singupApi;

  @override
  Future<Either<NetworkException, ApiResponse<SignupResponse>>> registerUser(
    SignupRequest user,
  ) async {
    try {
      final response = await singupApi.registerUser(user);
      return Right(response);
    } on DioException catch (e) {
      return Left(NetworkException(requestOptions: e.requestOptions));
    }
  }
}
