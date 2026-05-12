part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmittedEvent extends LoginEvent {
  final String username;
  final String password;
  LoginSubmittedEvent({required this.username, required this.password});
}

class LoginUsernameChangedEvent extends LoginEvent {
  final String username;
  LoginUsernameChangedEvent(this.username);
}

class LoginPasswordChangedEvent extends LoginEvent {
  final String password;
  LoginPasswordChangedEvent(this.password);
}

class LoginObscureToggledEvent extends LoginEvent {}
