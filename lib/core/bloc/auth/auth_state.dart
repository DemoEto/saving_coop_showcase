part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

  class _Undefined {
    const _Undefined();
  }

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
    Object? accessToken = const _Undefined(),
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      accessToken: accessToken is _Undefined
        ? this.accessToken
        : accessToken as String?,  
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
