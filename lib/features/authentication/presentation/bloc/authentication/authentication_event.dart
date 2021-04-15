part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class CheckAuthenticationStatusEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class RegistrationFormSubmitted extends AuthenticationEvent {
  final String email;
  final String password;
  final String repeatPassword;
  final bool isFormValid;

  RegistrationFormSubmitted({
    required this.email,
    required this.password,
    required this.repeatPassword,
    this.isFormValid = false,
  });

  @override
  List<Object> get props => [email, password, repeatPassword];
}

class LoginFormSubmitted extends AuthenticationEvent {
  final String email;
  final String password;
  final bool isFormValid;

  LoginFormSubmitted({
    required this.email,
    required this.password,
    this.isFormValid = false,
  });

  @override
  List<Object> get props => [email, password];
}