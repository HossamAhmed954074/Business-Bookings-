import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';

/// User data model for JSON serialization
class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    required super.role,
    required super.credits,
    required super.createdAt,
    super.phone,
  });

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      role: json['role'] as String? ?? 'customer',
      credits: (json['credits'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
    );
  }

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'credits': credits,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Copy with method for creating modified copies
  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? role,
    int? credits,
    DateTime? createdAt,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      credits: credits ?? this.credits,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
