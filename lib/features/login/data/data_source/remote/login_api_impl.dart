import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/login/data/data_source/remote/login_api.dart';
import 'package:flutter_assignment/features/login/data/models/login_response.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class LoginApiImpl extends LoginApi {
  LoginApiImpl({required this.networkService});

  final NetworkService networkService;

  @override
  Future<ApiResponse<LoginResponse>> loginUser(
    String userName,
    String password,
  ) async {
    try {
      {
        final response = await networkService.post(
          url: ApiPath.login,
          data: {'username': userName, 'password': password},
        );
        return ApiResponse(
          data: LoginResponse.fromJson(response.data as Map<String, dynamic>),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
