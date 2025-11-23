import 'package:bussines_booking/core/error/dio_exeption.dart';
import 'package:bussines_booking/core/error/failure.dart';
import 'package:bussines_booking/core/models/paginated_result.dart';
import 'package:bussines_booking/core/services/api/api_consumer.dart';
import 'package:bussines_booking/core/services/api/end_points.dart';
import 'package:bussines_booking/core/services/auth_storage_services.dart';
import 'package:bussines_booking/featuers/bookings/data/models/booking_model.dart';
import 'package:bussines_booking/featuers/bookings/domain/entities/booking.dart';
import 'package:bussines_booking/featuers/bookings/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

/// Implementation of BookingRepository
class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<Either<DioAppException, BookingEntity>> createBooking({
    required String sessionId,
    String? notes,
    String? idempotencyKey,
  }) async {
    try {
      final headers = <String, dynamic>{};
      if (idempotencyKey != null && idempotencyKey.isNotEmpty) {
        headers['idempotency-key'] = idempotencyKey;
      }

      final response = await apiConsumer.post(
        EndPoints.bookings,
        data: {'sessionId': sessionId, if (notes != null) 'notes': notes},
        headers: headers,
      );

      final booking = BookingModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right(booking);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DioAppException, PaginatedResult<BookingEntity>>> listBookings({
    int page = 1,
    int limit = 20,
    BookingStatus? status,
  }) async {
    try {
      //// shoud add token to header
      final token = await AuthStorageService.getToken();
      if (token == null) {
        return Left(DioAppException(message: 'No token found'));
      }
      final queryParams = {'page': page.toString(), 'limit': limit.toString()};

      final response = await apiConsumer.get(
        '/bookings',
        queryParameters: queryParams,
        headers: {'x-auth-token': token},
      );

      final responseData = response.data as Map<String, dynamic>;
      print(responseData);
      final items =
          (responseData['items'] as List<dynamic>?)
              ?.map(
                (json) => BookingModel.fromJson(json as Map<String, dynamic>),
              )
              .toList() ??
          [];

      final paginatedResult = PaginatedResult<BookingEntity>(
        items: items,
        page: responseData['page'] as int? ?? page,
        limit: responseData['limit'] as int? ?? limit,
        totalItems: responseData['total'] as int? ?? items.length,
        totalPages: responseData['totalPages'] as int? ?? 1,
      );

      return Right(paginatedResult);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DioAppException, BookingEntity>> getBookingById(
    String id,
  ) async {
    try {
      final response = await apiConsumer.get(EndPoints.bookingById(id));

      final booking = BookingModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right(booking);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DioAppException, BookingEntity>> updateBooking({
    required String id,
    String? notes,
  }) async {
    try {
      final response = await apiConsumer.put(
        EndPoints.bookingById(id),
        data: {if (notes != null) 'notes': notes},
      );

      final booking = BookingModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right(booking);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DioAppException, BookingEntity>> confirmOrCancelBooking({
    required String id,
    required BookingStatus status,
  }) async {
    try {
      // Only confirmed and cancelled statuses are allowed
      if (status != BookingStatus.confirmed &&
          status != BookingStatus.cancelled) {
        return Left(
          DioAppException(message: 'Status must be "confirmed" or "cancelled"'),
        );
      }

      final response = await apiConsumer.put(
        EndPoints.confirmBooking(id),
        data: {'status': status.value},
      );

      final booking = BookingModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return Right(booking);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DioAppException, void>> deleteBooking(String id) async {
    try {
      await apiConsumer.delete(EndPoints.bookingById(id));
      return const Right(null);
    } on DioAppException catch (e) {
      return Left(e);
    }
  }
}
