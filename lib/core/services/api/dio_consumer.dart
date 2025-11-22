import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/services/api/api_consumer.dart';
import 'package:bussines_booking/core/services/api/api_interceptors.dart';
import 'package:bussines_booking/core/services/api/end_points.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  DioConsumer({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      validateStatus: (status) =>
          status != null && status >= 200 && status < 300,
    );
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  final Dio dio;

  @override
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete<dynamic>(
        url,
        data: isFormData ? FormData.fromMap({...?data}) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw DioAppException.fromDioException(e);
    }
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw DioAppException.fromDioException(e);
    }
  }

  @override
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch<dynamic>(
        url,
        data: isFormData ? FormData.fromMap({...?data}) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw DioAppException.fromDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        url,
        data: isFormData ? FormData.fromMap({...?data}) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw DioAppException.fromDioException(e);
    }
  }
}
