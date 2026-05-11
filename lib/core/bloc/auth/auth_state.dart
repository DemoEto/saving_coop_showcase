part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final String? accessToken;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.accessToken,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? accessToken,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      accessToken: accessToken ?? this.accessToken,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
