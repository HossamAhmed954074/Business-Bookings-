import 'package:bussines_booking/core/services/auth_storage_services.dart';
import 'package:bussines_booking/featuers/auth/presentation/screens/login_screen.dart';
import 'package:bussines_booking/featuers/auth/presentation/screens/register_screen.dart';
import 'package:bussines_booking/featuers/home/presentation/screens/home_screen.dart';
import 'package:bussines_booking/featuers/profile/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final isLoggedIn = await AuthStorageService.isLoggedIn();
      final isGoingToLogin = state.matchedLocation == loginRoute;
      final isGoingToRegister = state.matchedLocation == registerRoute;

      // If user is logged in and trying to access login/register, redirect to home
      if (isLoggedIn && (isGoingToLogin || isGoingToRegister)) {
        return homeRoute;
      }

      // If user is not logged in and trying to access home, redirect to login
      if (!isLoggedIn && state.matchedLocation == homeRoute) {
        return loginRoute;
      }

      // No redirect needed
      return null;
    },
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
      GoRoute(path: homeRoute, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: profileRoute,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );

  // Example method to clear authentication cache
  static void clearAuthCache() async {
    await AuthStorageService.clearToken();
  }
}
