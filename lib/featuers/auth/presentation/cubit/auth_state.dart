import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required this.user});
  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  const AuthError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class AuthRegistrationSuccess extends AuthState {
  const AuthRegistrationSuccess({
    this.message = 'Registration successful! Please login.',
  });
  final String message;

  @override
  List<Object?> get props => [message];
}
