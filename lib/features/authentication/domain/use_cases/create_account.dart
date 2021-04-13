import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/core/use_cases/use_case.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class CreateAccount implements UseCase<AuthenticationResult, Params> {
  final AuthenticationRepository authenticationRepository;

  CreateAccount(this.authenticationRepository);

  @override
  Future<Either<Failure, AuthenticationResult>> call(Params params) async {
    return await authenticationRepository.createAccount(email: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
