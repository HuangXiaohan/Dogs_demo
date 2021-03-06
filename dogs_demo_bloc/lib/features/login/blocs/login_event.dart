part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginPressedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginPressedEvent(this.email, this.password);
}
