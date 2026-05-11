import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthAppStarted>(_onAppStarted);
    on<AuthStatusChanged>(_onStatusChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAppStarted(
    AuthAppStarted event,
    Emitter<AuthState> emit,
  ) async {
    // Simulate checking stored token (e.g., from FlutterSecureStorage)
    await Future.delayed(const Duration(milliseconds: 1500));
    // No stored token → go to login
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  void _onStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
      status: event.isAuthenticated
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated,
    ));
  }

  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    // Clear stored token here in production
    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
      accessToken: null,
    ));
  }
}
