import 'package:dartz/dartz.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/core/use_cases/use_cases.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class LogOut extends FutureUseCase<AuthenticationResult, NoParams>{
  final AuthenticationRepository authenticationRepository;

  LogOut(this.authenticationRepository);

  @override
  Future<Either<Failure, AuthenticationResult>> call(NoParams params) async {
    await authenticationRepository.logOut();
    return Right(AuthenticationResult.logged_out);
  }

}