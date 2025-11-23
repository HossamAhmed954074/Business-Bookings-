import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:bussines_booking/featuers/bookings/domain/usecases/create_booking_usecase.dart';
import 'package:bussines_booking/featuers/bookings/domain/usecases/delete_booking_usecase.dart';
import 'package:bussines_booking/featuers/bookings/domain/usecases/list_bookings_usecase.dart';
import 'package:bussines_booking/featuers/bookings/presentation/cubit/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

/// Booking Cubit for managing booking state
class BookingCubit extends Cubit<BookingState> {
  BookingCubit({
    required this.createBookingUseCase,
    required this.listBookingsUseCase,
    required this.deleteBookingUseCase,
  }) : super(BookingInitial());
  final CreateBookingUseCase createBookingUseCase;
  final ListBookingsUseCase listBookingsUseCase;
  final DeleteBookingUseCase deleteBookingUseCase;

  /// Load bookings with optional status filter
  Future<void> loadBookings({
    int page = 1,
    int limit = 20,
    BookingStatus? status,
  }) async {
    emit(BookingLoading());

    final result = await listBookingsUseCase(
      page: page,
      limit: limit,
      status: status,
    );

    result.fold(
      (failure) => emit(BookingError(message: failure.message)),
      (paginatedResult) => emit(
        BookingsLoaded(
          bookings: paginatedResult.items,
          currentPage: paginatedResult.page,
          totalPages: paginatedResult.totalPages,
          hasMore: paginatedResult.hasNextPage,
        ),
      ),
    );
  }

  /// Create a new booking
  Future<void> createBooking({required String sessionId, String? notes}) async {
    emit(BookingLoading());

    // Generate idempotency key to prevent duplicate bookings
    final idempotencyKey = const Uuid().v4();

    final result = await createBookingUseCase(
      sessionId: sessionId,
      notes: notes,
      idempotencyKey: idempotencyKey,
    );

    result.fold(
      (failure) => emit(BookingError(message: failure.message)),
      (booking) => emit(BookingCreated(booking: booking)),
    );
  }

  /// Delete a booking
  Future<void> deleteBooking(String id) async {
    emit(BookingLoading());

    final result = await deleteBookingUseCase(id);

    result.fold(
      (failure) => emit(BookingError(message: failure.message)),
      (_) => emit(const BookingDeleted()),
    );
  }
}
