import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:equatable/equatable.dart';

/// Booking state
abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class BookingInitial extends BookingState {}

/// Loading state
class BookingLoading extends BookingState {}

/// Bookings loaded state
class BookingsLoaded extends BookingState {
  const BookingsLoaded({
    required this.bookings,
    required this.currentPage,
    required this.totalPages,
    required this.hasMore,
  });
  final List<BookingEntity> bookings;
  final int currentPage;
  final int totalPages;
  final bool hasMore;

  @override
  List<Object?> get props => [bookings, currentPage, totalPages, hasMore];
}

/// Booking created successfully
class BookingCreated extends BookingState {
  const BookingCreated({required this.booking});
  final BookingEntity booking;

  @override
  List<Object?> get props => [booking];
}

/// Booking deleted successfully
class BookingDeleted extends BookingState {
  const BookingDeleted({this.message = 'Booking deleted successfully'});
  final String message;

  @override
  List<Object?> get props => [message];
}

/// Error state
class BookingError extends BookingState {
  const BookingError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
