import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final String? userId; // Add userId field

  const LoginState({
    this.email = 'donero',
    this.password = 'ewedon',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.userId, // Initialize userId
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? userId, // Add userId to copyWith
  }) {
    return LoginState(
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
    email,
    password,
    isLoading,
    isSuccess,
    errorMessage,
    userId, // Add userId to props
  ];
}
