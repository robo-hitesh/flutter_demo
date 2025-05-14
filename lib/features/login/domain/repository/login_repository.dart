import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/login/data/models/login_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<NetworkException, ApiResponse<LoginResponse>>> login(
    String userName,
    String password,
  );
}
