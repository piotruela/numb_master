import 'package:numb_master/core/use_cases/use_cases.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class GetAuthenticationStatus extends UseCase<AuthenticationResult, NoParams>{
  final AuthenticationRepository authenticationRepository;

  GetAuthenticationStatus(this.authenticationRepository);

  @override
  AuthenticationResult call(NoParams params) {
    return authenticationRepository.getAuthenticationStatus();
  }

}