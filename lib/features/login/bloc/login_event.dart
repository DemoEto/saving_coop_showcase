part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;
  LoginSubmitted({required this.username, required this.password});
}

class LoginUsernameChanged extends LoginEvent {
  final String username;
  LoginUsernameChanged(this.username);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged(this.password);
}

class LoginObscureToggled extends LoginEvent {}
