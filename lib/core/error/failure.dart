import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  const Failure({required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

/// Server-related failures (5xx errors)
class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Server error occurred',
    super.statusCode,
  });
}

/// Network-related failures (connectivity issues)
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}

/// Authentication failures (401, token issues)
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({super.message = 'Authentication failed'})
    : super(statusCode: 401);
}

/// Authorization failures (403, permission issues)
class AuthorizationFailure extends Failure {
  const AuthorizationFailure({
    super.message = 'You do not have permission to perform this action',
  }) : super(statusCode: 403);
}

/// Resource not found failures (404)
class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Resource not found'})
    : super(statusCode: 404);
}

/// Validation failures (400, invalid input)
class ValidationFailure extends Failure {
  const ValidationFailure({super.message = 'Validation failed', this.errors})
    : super(statusCode: 400);
  final Map<String, dynamic>? errors;

  @override
  List<Object?> get props => [message, statusCode, errors];
}

/// Conflict failures (409, duplicate resource)
class ConflictFailure extends Failure {
  const ConflictFailure({super.message = 'Resource already exists'})
    : super(statusCode: 409);
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error occurred'});
}

/// Unknown/unexpected failures
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message = 'An unexpected error occurred'});
}
