import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String username;
  final String email;
  final String password;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final String? userId; // Add userId field

  const SignupState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.userId, // Initialize userId
  });

  SignupState copyWith({
    String? username,
    String? email,
    String? password,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? userId, // Add userId to copyWith
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      userId: userId ?? this.userId, // Copy userId
    );
  }

  @override
  List<Object?> get props => [
    username,
    email,
    password,
    isLoading,
    isSuccess,
    errorMessage,
    userId, // Add userId to props
  ];
}
