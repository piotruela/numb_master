import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final CreateAccount createAccount;

  RegistrationBloc({
    required this.createAccount,
  }) : super(RegistrationState(type: RegistrationStateType.initial));

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is FormSubmitted) {
      if (event.isFormValid) {
        yield RegistrationState(type: RegistrationStateType.inProgress);
        final result = await createAccount(Params(email: event.email, password: event.password));
        yield result.fold(
          (failure) => RegistrationState(type: RegistrationStateType.failure),
          (success) => RegistrationState(type: RegistrationStateType.success),
        );
      }
    }
  }
}
