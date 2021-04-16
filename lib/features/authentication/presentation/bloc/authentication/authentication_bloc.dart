import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numb_master/core/use_cases/use_cases.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart' as register;
import 'package:numb_master/features/authentication/domain/use_cases/get_authentication_status.dart';
import 'package:numb_master/features/authentication/domain/use_cases/get_logged_user.dart';
import 'package:numb_master/features/authentication/domain/use_cases/log_in.dart' as login;
import 'package:numb_master/features/authentication/domain/use_cases/log_out.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final register.CreateAccount createAccount;
  final GetAuthenticationStatus getAuthenticationStatus;
  final login.LogIn logIn;
  final LogOut logOut;
  final GetLoggedUser getLoggedUser;

  AuthenticationBloc({
    required this.createAccount,
    required this.getAuthenticationStatus,
    required this.logIn,
    required this.logOut,
    required this.getLoggedUser,
  }) : super(AuthenticationState(type: AuthenticationStateType.initial));

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is CheckAuthenticationStatusEvent) {
      yield AuthenticationState(type: AuthenticationStateType.inProgress);
      final authenticationStatus = getAuthenticationStatus(NoParams());
      await Future.delayed(const Duration(seconds: 1));
      if (authenticationStatus == AuthenticationResult.logged_out) {
        yield AuthenticationState(type: AuthenticationStateType.logged_out);
      } else {
        yield AuthenticationState(type: AuthenticationStateType.logged_out, loggerUser: getLoggedUser(NoParams()));
      }
    } else if (event is RegistrationFormSubmittedEvent) {
      if (event.isFormValid) {
        yield AuthenticationState(type: AuthenticationStateType.inProgress);
        final result = await createAccount(register.Params(email: event.email, password: event.password));
        yield result.fold(
          (failure) => AuthenticationState(type: AuthenticationStateType.failure),
          (success) => AuthenticationState(
            type: AuthenticationStateType.registered,
            loggerUser: getLoggedUser(NoParams()),
          ),
        );
      }
    } else if (event is LoginFormSubmittedEvent) {
      if (event.isFormValid) {
        yield AuthenticationState(type: AuthenticationStateType.inProgress);
        final result = await logIn(login.Params(email: event.email, password: event.password));
        yield result.fold(
          (failure) => AuthenticationState(type: AuthenticationStateType.failure),
          (success) => AuthenticationState(
            type: AuthenticationStateType.logged_in,
            loggerUser: getLoggedUser(NoParams()),
          ),
        );
      }
    } else if (event is LogOutEvent) {
      yield AuthenticationState(type: AuthenticationStateType.inProgress);
      await logOut(NoParams());
      yield AuthenticationState(type: AuthenticationStateType.logged_out);
    }
  }
}
