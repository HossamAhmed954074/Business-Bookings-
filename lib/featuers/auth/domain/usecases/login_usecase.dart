import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';
import 'package:bussines_booking/featuers/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for user login
class LoginUseCase {
  LoginUseCase({required this.repository});
  final AuthRepository repository;

  Future<Either<DioAppException, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return repository.login(email: email, password: password);
  }
}
