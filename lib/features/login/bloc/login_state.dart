part of 'login_bloc.dart';

abstract class LoginState {
  final bool obscurePassword;
  const LoginState({this.obscurePassword = true});
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(obscurePassword: true);
}

class LoginLoading extends LoginState {
  const LoginLoading({super.obscurePassword});
}

class LoginSuccess extends LoginState {
  final String token;
  const LoginSuccess(this.token);
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error, {super.obscurePassword});
}

class LoginObscureChanged extends LoginState {
  const LoginObscureChanged({required super.obscurePassword});
}
