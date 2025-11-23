import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/core/models/paginated_result.dart';
import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:bussines_booking/featuers/bookings/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for listing bookings
class ListBookingsUseCase {
  ListBookingsUseCase({required this.repository});
  final BookingRepository repository;

  Future<Either<DioAppException, PaginatedResult<BookingEntity>>> call({
    int page = 1,
    int limit = 20,
    BookingStatus? status,
  }) async {
    return repository.listBookings(page: page, limit: limit, status: status);
  }
}
