import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:bussines_booking/featuers/bookings/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

/// Use case for deleting a booking
class DeleteBookingUseCase {
  DeleteBookingUseCase({required this.repository});
  final BookingRepository repository;

  Future<Either<DioAppException, void>> call(String id) async {
    return repository.deleteBooking(id);
  }
}
