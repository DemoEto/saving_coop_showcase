part of 'login_bloc.dart';

abstract class LoginState {
  final bool obscurePassword;
  const LoginState({this.obscurePassword = true});
}

class LoginInitialState extends LoginState {
  const LoginInitialState() : super(obscurePassword: true);
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({super.obscurePassword});
}

class LoginSuccessState extends LoginState {
  final String token;
  const LoginSuccessState(this.token);
}

class LoginFailureState extends LoginState {
  final String error;
  const LoginFailureState(this.error, {super.obscurePassword});
}

class LoginObscureChangedState extends LoginState {
  const LoginObscureChangedState({required super.obscurePassword});
}
