import 'package:bussines_booking/core/services/auth_storage_services.dart';
import 'package:bussines_booking/featuers/auth/presentation/screens/login_screen.dart';
import 'package:bussines_booking/featuers/auth/presentation/screens/register_screen.dart';
import 'package:bussines_booking/featuers/bookings/presentation/screens/bookings_screen.dart';
import 'package:bussines_booking/featuers/classess/presentation/screens/class_schedules_screen.dart';
import 'package:bussines_booking/featuers/slider_menue/presentation/screens/slider_screen.dart';
import 'package:bussines_booking/featuers/notifications/presentation/screens/notifications_screen.dart';
import 'package:bussines_booking/featuers/profile/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String sliderRoute = '/slider';
  static const String profileRoute = '/profile';
  static const String notificationsRoute = '/notifications';
  static const String classSchedulesRoute = '/class-schedules';
  static const String bookingsRoute = '/bookings';

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    // redirect: (context, state) async {
    //   final isLoggedIn = await AuthStorageService.isLoggedIn();
    //   final isGoingToLogin = state.matchedLocation == loginRoute;
    //   final isGoingToRegister = state.matchedLocation == registerRoute;

    //   // If user is logged in and trying to access login/register, redirect to home
    //   if (isLoggedIn && (isGoingToLogin || isGoingToRegister)) {
    //     return homeRoute;
    //   }

    //   // If user is not logged in and trying to access home, redirect to login
    //   if (!isLoggedIn && state.matchedLocation == homeRoute) {
    //     return loginRoute;
    //   }

    //   // No redirect needed
    //   return null;
    // },
    routes: [
      // Define your app routes here
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: sliderRoute,
        builder: (context, state) => const SlideScreen(),
      ),
      GoRoute(
        path: profileRoute,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: notificationsRoute,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: classSchedulesRoute,
        builder: (context, state) => const ClassSchedulesScreen(),
      ),
      GoRoute(
        path: bookingsRoute,
        builder: (context, state) => const BookingsScreen(),
      ),
    ],
  );

  // Example method to clear authentication cache
  static Future<void> clearAuthCache() async {
    await AuthStorageService.clearToken();
  }
}
