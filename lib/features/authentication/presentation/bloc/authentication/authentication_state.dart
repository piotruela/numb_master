part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStateType type;
  final User? loggerUser;

  AuthenticationState({required this.type, this.loggerUser});

  @override
  List<Object?> get props => [type, loggerUser];
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
