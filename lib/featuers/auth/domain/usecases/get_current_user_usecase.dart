import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';
import 'package:bussines_booking/featuers/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for getting current authenticated user
class GetCurrentUserUseCase {
  GetCurrentUserUseCase({required this.repository});
  final AuthRepository repository;

  Future<Either<DioAppException, UserEntity>> call() async {
    return repository.getCurrentUser();
  }
}
