import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';

/// Booking data model for JSON serialization
class BookingModel extends BookingEntity {
  const BookingModel({
    required super.id,
    required super.user,
    required super.businessId,
    required super.session,
    required super.status,
    required super.credits,
    required super.bookingDate,
    required super.createdAt,
    required super.updatedAt,
    super.notes,
    super.confirmedAt,
  });

  /// Create BookingModel from JSON
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    // Parse nested userId object
    final userJson = json['userId'] as Map<String, dynamic>;
    final user = BookingUser(
      id: userJson['_id'] as String,
      name: userJson['name'] as String,
      email: userJson['email'] as String,
      phone: userJson['phone'] as String?,
    );

    // Parse nested sessionId object
    final sessionJson = json['sessionId'] as Map<String, dynamic>;
    final session = BookingSession(
      id: sessionJson['_id'] as String,
      name: sessionJson['name'] as String,
      date: DateTime.parse(sessionJson['date'] as String),
      startTime: sessionJson['startTime'] as String,
      endTime: sessionJson['endTime'] as String,
    );

    return BookingModel(
      id: json['_id'] as String,
      user: user,
      businessId: json['businessId'] as String,
      session: session,
      status: BookingStatus.fromString(json['status'] as String),
      credits: json['credits'] as int,
      bookingDate: DateTime.parse(json['bookingDate'] as String),
      notes: json['notes'] as String?,
      confirmedAt: json['confirmedAt'] != null
          ? DateTime.parse(json['confirmedAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Convert BookingModel to JSON (for sending to API)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': user.id,
      'businessId': businessId,
      'sessionId': session.id,
      'status': status.value,
      'credits': credits,
      'bookingDate': bookingDate.toIso8601String(),
      'notes': notes,
      'confirmedAt': confirmedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
