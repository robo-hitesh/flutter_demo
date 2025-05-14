import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_request.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_response.dart';

abstract class SingupApi {
  Future<ApiResponse<SignupResponse>> registerUser(SignupRequest user);
}
