part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final RegistrationStateType type;

  RegistrationState({required this.type});

  @override
  List<Object> get props => [type];
}

enum RegistrationStateType {
  initial,
  inProgress,
  success,
  failure,
  invalidForm,
}
