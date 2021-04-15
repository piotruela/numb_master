import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numb_master/core/use_cases/future_use_case.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart' as register;
import 'package:numb_master/features/authentication/domain/use_cases/get_authentication_status.dart';
import 'package:numb_master/features/authentication/domain/use_cases/log_in.dart' as login;

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final register.CreateAccount createAccount;
  final GetAuthenticationStatus getAuthenticationStatus;
  final login.LogIn logIn;

  AuthenticationBloc({
    required this.createAccount,
    required this.getAuthenticationStatus,
    required this.logIn,
  }) : super(AuthenticationState(type: AuthenticationStateType.initial));

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is CheckAuthenticationStatusEvent) {
      yield AuthenticationState(type: AuthenticationStateType.inProgress);
      final result = getAuthenticationStatus(NoParams());
      await Future.delayed(const Duration(seconds: 1));
      yield result.fold(
        (nonAuthenticated) => AuthenticationState(type: AuthenticationStateType.logged_out),
        (authenticated) => AuthenticationState(type: AuthenticationStateType.logged_in),
      );
    } else if (event is RegistrationFormSubmitted) {
      if (event.isFormValid) {
        yield AuthenticationState(type: AuthenticationStateType.inProgress);
        final result = await createAccount(register.Params(email: event.email, password: event.password));
        yield result.fold(
          (failure) => AuthenticationState(type: AuthenticationStateType.failure),
          (success) => AuthenticationState(type: AuthenticationStateType.registered),
        );
      }
    } else if (event is LoginFormSubmitted) {
      if (event.isFormValid) {
        yield AuthenticationState(type: AuthenticationStateType.inProgress);
        final result = await logIn(login.Params(email: event.email, password: event.password));
        yield result.fold(
          (failure) => AuthenticationState(type: AuthenticationStateType.failure),
          (success) => AuthenticationState(type: AuthenticationStateType.logged_in),
        );
      }
    }
  }
}
