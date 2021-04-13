import 'package:dartz/dartz.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/core/use_cases/use_case.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';

class RestoreSession implements UseCase<AuthenticationResult, NoParams>{
  @override
  Future<Either<Failure, AuthenticationResult>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}