import 'package:dio/dio.dart';
import 'package:flutter_assignment/shared/domain/services/network_service.dart';

class NetworkServiceImpl extends NetworkService {
  NetworkServiceImpl(this.dio);
  final Dio dio;

  @override
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) {
    return dio.get(url, queryParameters: queryParams);
  }

  @override
  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    Options? options,
  }) {
    return dio.post(url, data: data, options: options);
  }

  @override
  Future<Response> delete({required String url}) {
    return dio.delete(url);
  }

  @override
  Future<Response> put({required String url}) {
    return dio.put(url);
  }

  @override
  Future<Response> request({
    required String url,
    required Map<String, dynamic> data,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) {
    return dio.request(
      url,
      data: data,
      options: options,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response> fileUpload({
    required String url,
    required FormData formData,
    Options? options,
  }) {
    return dio.post(url, data: formData, options: options);
  }
}
