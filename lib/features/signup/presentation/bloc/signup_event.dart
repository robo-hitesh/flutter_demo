import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class UserNameChanged extends SignupEvent {
  final String userName;

  const UserNameChanged(this.userName);

  @override
  List<Object> get props => [userName];
}

class SignupEmailChanged extends SignupEvent {
  final String email;

  const SignupEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  const SignupPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignupConfirmPasswordChanged extends SignupEvent {
  final String password;

  const SignupConfirmPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
