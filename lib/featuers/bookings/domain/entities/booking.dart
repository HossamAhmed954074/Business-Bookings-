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

/// User data in booking (nested from API)
class BookingUser extends Equatable {
  const BookingUser({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
  });
  final String id;
  final String name;
  final String email;
  final String? phone;

  @override
  List<Object?> get props => [id, name, email, phone];
}

/// Session data in booking (nested from API)
class BookingSession extends Equatable {
  const BookingSession({
    required this.id,
    required this.name,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
  final String id;
  final String name;
  final DateTime date;
  final String startTime;
  final String endTime;

  @override
  List<Object?> get props => [id, name, date, startTime, endTime];
}

/// Booking domain entity
class BookingEntity extends Equatable {
  const BookingEntity({
    required this.id,
    required this.user,
    required this.businessId,
    required this.session,
    required this.status,
    required this.credits,
    required this.bookingDate,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
    this.confirmedAt,
  });
  final String id;
  final BookingUser user;
  final String businessId;
  final BookingSession session;
  final BookingStatus status;
  final int credits;
  final DateTime bookingDate;
  final String? notes;
  final DateTime? confirmedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
    id,
    user,
    businessId,
    session,
    status,
    credits,
    bookingDate,
    notes,
    confirmedAt,
    createdAt,
    updatedAt,
  ];
}
