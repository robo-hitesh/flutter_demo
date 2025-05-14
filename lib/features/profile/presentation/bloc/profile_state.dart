import 'package:flutter_assignment/features/profile/data/model/profile.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  ProfileSuccessState(this.profile);
  Profile profile;
}

class ProfileErrorState extends ProfileState {
  ProfileErrorState(this.message);
  final String message;
}
