import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_request.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class SignupRepository {
  Future<Either<NetworkException, ApiResponse<SignupResponse>>> registerUser(
    SignupRequest user,
  );
}
