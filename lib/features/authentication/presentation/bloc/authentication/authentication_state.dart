part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStateType type;

  AuthenticationState({required this.type});

  @override
  List<Object> get props => [type];
}

enum AuthenticationStateType {
  initial,
  inProgress,
  registered,
  logged_in,
  failure,
  invalidForm,
  logged_out
}
