import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/profile/data/model/profile.dart';

abstract class ProfileApi {
  Future<ApiResponse<Profile>> fetchProfile(String profileId);
}
