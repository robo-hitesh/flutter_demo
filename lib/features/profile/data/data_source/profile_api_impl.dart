import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/core/utils/api_path.dart';
import 'package:flutter_assignment/features/profile/data/data_source/profile_api.dart';
import 'package:flutter_assignment/features/profile/data/model/profile.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class ProfileApiImpl implements ProfileApi {
  ProfileApiImpl({required this.networkService});

  NetworkService networkService;

  @override
  Future<ApiResponse<Profile>> fetchProfile(String profileId) async {
    try {
      final response = await networkService.get(
        url: ApiPath.users + '/${profileId}',
      );

      return ApiResponse(
        data: Profile.fromJson(response.data as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }
}
