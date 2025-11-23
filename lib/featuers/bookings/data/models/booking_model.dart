import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';

/// Booking data model for JSON serialization
class BookingModel extends BookingEntity {
  const BookingModel({
    required super.id,
    required super.userId,
    required super.sessionId,
    required super.status,
    required super.bookedAt,
    super.notes,
    super.confirmedAt,
    super.sessionName,
    super.sessionInstructor,
    super.sessionDate,
    super.sessionTime,
  });

  /// Create BookingModel from JSON
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    // Extract session data if populated
    final session = json['session'] as Map<String, dynamic>?;

    return BookingModel(
      id: json['_id'] as String? ?? json['id'] as String,
      userId: json['userId'] as String? ?? json['user'] as String? ?? '',
      sessionId:
          json['sessionId'] as String? ??
          json['session']?['_id'] as String? ??
          '',
      status: BookingStatus.fromString(json['status'] as String? ?? 'pending'),
      notes: json['notes'] as String?,
      bookedAt: json['bookedAt'] != null
          ? DateTime.parse(json['bookedAt'] as String)
          : DateTime.now(),
      confirmedAt: json['confirmedAt'] != null
          ? DateTime.parse(json['confirmedAt'] as String)
          : null,
      sessionName: session?['name'] as String?,
      sessionInstructor: session?['instructorName'] as String?,
      sessionDate: session?['date'] != null
          ? DateTime.parse(session!['date'] as String)
          : null,
      sessionTime: session?['startTime'] as String?,
    );
  }

  /// Convert BookingModel to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'sessionId': sessionId,
      'status': status.value,
      'notes': notes,
      'bookedAt': bookedAt.toIso8601String(),
      'confirmedAt': confirmedAt?.toIso8601String(),
    };
  }

  /// Copy with method
  BookingModel copyWith({
    String? id,
    String? userId,
    String? sessionId,
    BookingStatus? status,
    String? notes,
    DateTime? bookedAt,
    DateTime? confirmedAt,
    String? sessionName,
    String? sessionInstructor,
    DateTime? sessionDate,
    String? sessionTime,
  }) {
    return BookingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      sessionId: sessionId ?? this.sessionId,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      bookedAt: bookedAt ?? this.bookedAt,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      sessionName: sessionName ?? this.sessionName,
      sessionInstructor: sessionInstructor ?? this.sessionInstructor,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionTime: sessionTime ?? this.sessionTime,
    );
  }
}
