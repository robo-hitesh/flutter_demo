import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/login/data/models/login_response.dart';

abstract class LoginApi {
  Future<ApiResponse<LoginResponse>> loginUser(
    String userName,
    String password,
  );
}
