import 'package:flutter_assignment/core/network/exception/network_exceptions.dart';
import 'package:flutter_assignment/core/resources/api_response.dart';
import 'package:flutter_assignment/features/profile/data/data_source/profile_api.dart';
import 'package:flutter_assignment/features/profile/data/model/profile.dart';
import 'package:flutter_assignment/features/profile/domain/repository/profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(this.profileApi);

  ProfileApi profileApi;

  @override
  Future<Either<NetworkException, ApiResponse<Profile>>> fetchProfile(
    String profileId,
  ) async {
    try {
      final result = await profileApi.fetchProfile(profileId);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
