import 'package:bussines_booking/featuers/auth/domain/usecases/login_usecase.dart';
import 'package:bussines_booking/featuers/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Authentication Cubit for managing auth state
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.loginUseCase}) : super(AuthInitial());

  final LoginUseCase loginUseCase;

  /// Login user
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await loginUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }
}
