import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    Options? options,
  });

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  });

  Future<Response> delete({required String url});

  Future<Response> put({required String url});

  Future<Response> fileUpload({
    required String url,
    required FormData formData,
    Options? options,
  });

  Future<Response> request({
    required String url,
    required Map<String, dynamic> data,
    Options options,
    Map<String, dynamic>? queryParams,
  });
}
