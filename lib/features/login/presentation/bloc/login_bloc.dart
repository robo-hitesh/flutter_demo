import 'dart:async';

import 'package:flutter_assignment/features/login/domain/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final LoginRepository loginRepository;

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      emit(state.copyWith(isLoading: true));

      final result = await loginRepository.login(state.email, state.password);

      result.fold(
        (left) => emit(
          state.copyWith(
            isSuccess: false,
            errorMessage: "Invalid email or password",
          ),
        ),
        (right) => emit(
          state.copyWith(
            isSuccess: true,
            userId: right.data?.token ?? "",
            errorMessage: null,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }
}
