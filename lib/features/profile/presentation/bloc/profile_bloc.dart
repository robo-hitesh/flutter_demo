import 'package:flutter_assignment/features/profile/data/model/profile.dart';
import 'package:flutter_assignment/features/profile/domain/repository/profile_repository.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(ProfileInitialState()) {
    on<ProfileFetchEvent>(_fetchProfile);
  }

  final ProfileRepository profileRepository;

  Future<void> _fetchProfile(
    ProfileFetchEvent event,
    Emitter<ProfileState> state,
  ) async {
    emit(ProfileLoadingState());
    final result = await profileRepository.fetchProfile(event.profileId);
    result.fold(
      (left) => emit(
        ProfileErrorState(left.errorMessage ?? "Failed to load Product"),
      ),
      (right) => emit(
        ProfileSuccessState(
          right.data ??
              Profile(
                id: 0,
                email: '',
                username: '',
                phone: '',
                name: Name(firstname: '', lastname: ''),
                address: Address(
                  city: '',
                  street: '',
                  number: 1,
                  zipcode: '',
                  geolocation: GeoLocation(lat: '', long: ''),
                ),
              ),
        ),
      ),
    );
  }
}
