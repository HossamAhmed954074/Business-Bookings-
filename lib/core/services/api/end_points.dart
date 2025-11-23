import 'package:bussines_booking/core/secrets/secret_constatnts.dart';

class EndPoints {
  static final String baseUrl =
      SecretConstants.apiBaseUrl ?? 'http://localhost:3000';

  // Auth endpoints
  static final String authBase = '$baseUrl/auth';
  static final String authRegister = '$authBase/register';
  static final String authLogin = '$authBase/login';
  static final String authMe = '$authBase/me';

  // Business endpoints
  static final String businesses = '$baseUrl/businesses';
  static String businessById(String id) => '$businesses/$id';

  // Class Session endpoints
  static final String classSessions = '$baseUrl/class-sessions';
  static String classSessionById(String id) => '$classSessions/$id';

  // Booking endpoints
  static final String bookings = '$baseUrl/bookings';
  static String bookingById(String id) => '$bookings/$id';
  static String confirmBooking(String id) => '$bookings/$id/confirm';

  // Instructor endpoints
  static final String instructors = '$baseUrl/instructors';
  static String instructorById(String id) => '$instructors/$id';

  // Credits endpoints
  static final String creditsPackages = '$baseUrl/credits/packages';
  static final String creditsPurchase = '$baseUrl/credits/purchase';
}
