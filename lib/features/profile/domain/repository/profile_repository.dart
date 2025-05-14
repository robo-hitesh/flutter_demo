import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/profile/data/model/profile.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProfileRepository {
  Future<Either<NetworkException, ApiResponse<Profile>>> fetchProfile(
    String profileId,
  );
}
