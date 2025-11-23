import 'package:equatable/equatable.dart';

/// Booking status enum
enum BookingStatus {
  pending,
  confirmed,
  cancelled;

  static BookingStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'cancelled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.pending;
    }
  }

  String get value {
    switch (this) {
      case BookingStatus.pending:
        return 'pending';
      case BookingStatus.confirmed:
        return 'confirmed';
      case BookingStatus.cancelled:
        return 'cancelled';
    }
  }
}

/// Booking domain entity
class BookingEntity extends Equatable {
  const BookingEntity({
    required this.id,
    required this.userId,
    required this.sessionId,
    required this.status,
    required this.bookedAt,
    this.notes,
    this.confirmedAt,
    this.sessionName,
    this.sessionInstructor,
    this.sessionDate,
    this.sessionTime,
  });
  final String id;
  final String userId;
  final String sessionId;
  final BookingStatus status;
  final String? notes;
  final DateTime bookedAt;
  final DateTime? confirmedAt;

  // Populated session details (from API)
  final String? sessionName;
  final String? sessionInstructor;
  final DateTime? sessionDate;
  final String? sessionTime;

  @override
  List<Object?> get props => [
    id,
    userId,
    sessionId,
    status,
    notes,
    bookedAt,
    confirmedAt,
    sessionName,
    sessionInstructor,
    sessionDate,
    sessionTime,
  ];
}
