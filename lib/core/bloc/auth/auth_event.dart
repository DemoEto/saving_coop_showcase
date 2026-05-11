part of 'auth_bloc.dart';

abstract class AuthEvent {}

/// Fired on app start to check stored token
class AuthAppStarted extends AuthEvent {}

/// Fired when login/logout changes auth status
class AuthStatusChanged extends AuthEvent {
  final bool isAuthenticated;
  AuthStatusChanged(this.isAuthenticated);
}

/// Fired when user taps logout
class AuthLogoutRequested extends AuthEvent {}
