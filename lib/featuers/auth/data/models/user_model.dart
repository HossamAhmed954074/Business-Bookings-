import 'package:bussines_booking/featuers/auth/domain/entities/user_entity.dart';

/// User data model for JSON serialization
class UserModel extends UserEntity {
  const UserModel({required super.token});

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token'] as String);
  }

  /// Copy with method for creating modified copies
}
