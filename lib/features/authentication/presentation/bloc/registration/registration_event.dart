part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class FormSubmitted extends RegistrationEvent {
  final String email;
  final String password;
  final String repeatPassword;
  final bool isFormValid;

  FormSubmitted({
    required this.email,
    required this.password,
    required this.repeatPassword,
    this.isFormValid = false,
  });

  @override
  List<Object> get props => [email, password, repeatPassword];
}
