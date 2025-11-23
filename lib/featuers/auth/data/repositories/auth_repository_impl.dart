import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/core/services/api/api_consumer.dart';
import 'package:bussines_booking/core/services/api/end_points.dart';
import 'package:bussines_booking/core/services/auth_storage_services.dart';
import 'package:bussines_booking/featuers/auth/data/models/user_model.dart';
import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';
import 'package:bussines_booking/featuers/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<Either<DioAppException, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.authLogin,
        data: {'email': email, 'password': password},
      );

      final responseData = response.data as Map<String, dynamic>;

      final token = responseData['token'] as String?;

      if (token != null && token.isNotEmpty) {
        await AuthStorageService.saveToken(token);
      }

      final userData =
          responseData['user'] as Map<String, dynamic>? ?? responseData;
      final user = UserModel.fromJson(userData);

      return Right(user);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DioAppException, UserEntity>> getCurrentUser() async {
    try {
      // Check if token exists
      final token = await AuthStorageService.getToken();
      if (token == null || token.isEmpty) {
        return Left(DioAppException(message: 'Not authenticated'));
      }

      final response = await apiConsumer.get(
        EndPoints.authMe,
        queryParameters: {
          'token': token,
        }, // Support both query param and header
      );

      final responseData = response.data as Map<String, dynamic>;

      // Get user data - could be nested in 'user' key or at root level
      final userData =
          responseData['user'] as Map<String, dynamic>? ?? responseData;
      final user = UserModel.fromJson(userData);

      return Right(user);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }
}
