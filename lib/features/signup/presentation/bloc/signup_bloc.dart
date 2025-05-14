import 'dart:async';

import 'package:flutter_assignment/features/signup/data/model/signup_request.dart';
import 'package:flutter_assignment/features/signup/domain/repository/signup_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_state.dart';
import 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this.signupRepository) : super(SignupState()) {
    on<UserNameChanged>(_onUserNameChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  final SignupRepository signupRepository;

  void _onSignupSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      emit(state.copyWith(isLoading: true));

      final result = await signupRepository.registerUser(
        SignupRequest(
          id: 0,
          username: state.username,
          email: state.email,
          password: state.password,
        ),
      );

      result.fold(
        (left) => emit(
          state.copyWith(isSuccess: false, errorMessage: "Failed to register!"),
        ),
        (right) => emit(
          state.copyWith(
            isSuccess: true,
            userId: right.data?.id.toString(),
            errorMessage: null,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onUserNameChanged(
    UserNameChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(username: event.userName));
  }

  FutureOr<void> _onEmailChanged(
    SignupEmailChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onPasswordChanged(
    SignupPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }
}
