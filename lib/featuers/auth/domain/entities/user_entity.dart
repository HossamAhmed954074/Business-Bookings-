import 'package:equatable/equatable.dart';

/// User domain entity
class UserEntity extends Equatable {
  const UserEntity({required this.token});

  final String token;

  @override
  List<Object?> get props => [token];
}
