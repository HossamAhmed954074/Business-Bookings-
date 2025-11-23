import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:bussines_booking/featuers/bookings/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for creating a booking
class CreateBookingUseCase {
  CreateBookingUseCase({required this.repository});
  final BookingRepository repository;

  Future<Either<DioAppException, BookingEntity>> call({
    required String sessionId,
    String? notes,
    String? idempotencyKey,
  }) async {
    return repository.createBooking(
      sessionId: sessionId,
      notes: notes,
      idempotencyKey: idempotencyKey,
    );
  }
}
