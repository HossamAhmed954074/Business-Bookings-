import 'package:equatable/equatable.dart';

/// User domain entity
class UserEntity extends Equatable {
  const UserEntity({
    required this.name,
    required this.email,
    required this.role,
    required this.credits,
    required this.createdAt,
    this.phone,
  });

  final String name;
  final String email;
  final String? phone;
  final String role; // 'customer', 'business', 'admin'
  final int credits;
  final DateTime createdAt;

  @override
  List<Object?> get props => [name, email, phone, role, credits, createdAt];
}
