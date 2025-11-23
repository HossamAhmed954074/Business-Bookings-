import 'package:bussines_booking/core/services/auth_storage_services.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add bearer token to all requests if available
    final token = await AuthStorageService.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['x-auth-token'] = token;
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse) {
      if (err.response?.statusCode == 401) {
        // Token expired or invalid, clear it
        AuthStorageService.clearToken();
        // TODO: Navigate to login screen
      }
      // Handle other status codes
      if (err.response?.statusCode == 403) {
        // Handle forbidden error - insufficient permissions
      } else if (err.response?.statusCode == 404) {
        // Handle not found error
      } else if (err.response?.statusCode == 500) {
        // Handle server error
      }
    }

    super.onError(err, handler);
  }
}
