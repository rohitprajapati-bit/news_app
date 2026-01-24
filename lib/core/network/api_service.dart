import 'package:dio/dio.dart';
import 'package:news_app/core/network/api_client.dart';

abstract class ApiService {
  final ApiClient client;
  ApiService(this.client);

  Future<Response> getApi(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      return await client.dio.get(
        path,
        queryParameters: query,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(
    String path, {
    dynamic body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      return await client.dio.post(
        path,
        data: body,
        queryParameters: query,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> put(
    String path, {
    dynamic body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      return await client.dio.put(
        path,
        data: body,
        queryParameters: query,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> delete(
    String path, {
    dynamic body,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      return await client.dio.delete(
        path,
        data: body,
        queryParameters: query,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Exception("Connection timeout");
    } else if (e.type == DioExceptionType.badResponse) {
      return Exception("Server error: ${e.response?.statusCode}");
    } else if (e.type == DioExceptionType.connectionError) {
      return Exception("No Internet Connection");
    } else {
      return Exception("Unexpected error");
    }
  }
}
