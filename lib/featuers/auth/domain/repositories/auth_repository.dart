import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email and password
  Future<Either<DioAppException, UserEntity>> login({
    required String email,
    required String password,
  });

  /// Get current authenticated user
  Future<Either<DioAppException, UserEntity>> getCurrentUser();
}
