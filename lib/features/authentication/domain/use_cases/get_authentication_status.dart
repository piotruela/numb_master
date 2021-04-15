import 'package:dartz/dartz.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/core/use_cases/future_use_case.dart';
import 'package:numb_master/core/use_cases/use_case.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class GetAuthenticationStatus extends UseCase<AuthenticationResult, NoParams>{
  final AuthenticationRepository authenticationRepository;

  GetAuthenticationStatus(this.authenticationRepository);

  @override
  Either<Failure, AuthenticationResult> call(NoParams params) {
    return authenticationRepository.getAuthenticationStatus();
  }

}