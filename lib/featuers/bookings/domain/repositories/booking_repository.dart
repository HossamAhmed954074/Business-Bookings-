import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/core/models/paginated_result.dart';
import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:dartz/dartz.dart';

/// Booking repository interface
abstract class BookingRepository {
  /// Create a new booking
  Future<Either<DioAppException, BookingEntity>> createBooking({
    required String sessionId,
    String? notes,
    String? idempotencyKey,
  });

  /// List bookings with pagination and optional status filter
  Future<Either<DioAppException, PaginatedResult<BookingEntity>>> listBookings({
    int page = 1,
    int limit = 20,
    BookingStatus? status,
  });

  /// Get booking by ID
  Future<Either<DioAppException, BookingEntity>> getBookingById(String id);

  /// Update booking notes
  Future<Either<DioAppException, BookingEntity>> updateBooking({
    required String id,
    String? notes,
  });

  /// Confirm or cancel booking (business role only)
  Future<Either<DioAppException, BookingEntity>> confirmOrCancelBooking({
    required String id,
    required BookingStatus status,
  });

  /// Delete booking
  Future<Either<DioAppException, void>> deleteBooking(String id);
}
