import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/signup/data/data_source/remote/singup_api.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_request.dart';
import 'package:flutter_assignment/features/signup/data/model/signup_response.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class SingupApiImpl extends SingupApi {
  SingupApiImpl({required this.networkService});

  final NetworkService networkService;

  @override
  Future<ApiResponse<SignupResponse>> registerUser(SignupRequest user) async {
    try {
      {
        final response = await networkService.post(
          url: ApiPath.users,
          data: user.toJson(),
        );
        return ApiResponse(
          data: SignupResponse.fromJson(response.data as Map<String, dynamic>),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
