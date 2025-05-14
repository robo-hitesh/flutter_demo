import 'package:dio/dio.dart';

class NetworkException extends DioException {
  NetworkException({required super.requestOptions, this.errorMessage});

  final String? errorMessage;
}

class FetchDataException extends NetworkException {
  FetchDataException({required super.requestOptions, super.errorMessage});
}

class NoInternetException extends NetworkException {
  NoInternetException({required super.requestOptions, super.errorMessage});
}

class InvalidInputException extends NetworkException {
  InvalidInputException({required super.requestOptions, super.errorMessage});
}

//503
class ServiceUnavailableErrorException extends NetworkException {
  ServiceUnavailableErrorException({
    required super.requestOptions,
    super.errorMessage,
  });
}

//500
class InternalServerErrorException extends NetworkException {
  InternalServerErrorException({
    required super.requestOptions,
    super.errorMessage,
  });
}

//429
class TooManyRequestsException extends NetworkException {
  TooManyRequestsException({required super.requestOptions, super.errorMessage});
}

//404
class NotFoundException extends NetworkException {
  NotFoundException({required super.requestOptions, super.errorMessage});
}

//403
class ForBiddenException extends NetworkException {
  ForBiddenException({required super.requestOptions, super.errorMessage});
}

//401
class UnauthorizedException extends NetworkException {
  UnauthorizedException({required super.requestOptions, super.errorMessage});
}

class AccountLockoutException extends NetworkException {
  AccountLockoutException({required super.requestOptions, super.errorMessage});
}

//400
class BadRequestException extends NetworkException {
  BadRequestException({required super.requestOptions, super.errorMessage});
}

//204
class NoContentException extends NetworkException {
  NoContentException({required super.requestOptions, super.errorMessage});
}

//201
class CreatedException extends NetworkException {
  CreatedException({required super.requestOptions, super.errorMessage});
}

//400
class InvalidRequestException extends NetworkException {
  InvalidRequestException({required super.requestOptions, super.errorMessage});
}

class ConnectionTimeOutException extends NetworkException {
  ConnectionTimeOutException({
    required super.requestOptions,
    super.errorMessage,
  });
}

class SendTimeOutException extends NetworkException {
  SendTimeOutException({required super.requestOptions, super.errorMessage});
}

class ReceiveTimeOutException extends NetworkException {
  ReceiveTimeOutException({required super.requestOptions, super.errorMessage});
}

class UnknownException extends NetworkException {
  UnknownException({required super.requestOptions, super.errorMessage});
}
