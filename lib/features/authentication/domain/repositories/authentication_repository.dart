import 'package:dartz/dartz.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationResult>> createAccount({required String email, required String password});
  Future<Either<Failure, AuthenticationResult>> logIn({required String email, required String password});
  Future<Either<Failure, AuthenticationResult>> logOut();
  Either<Failure, AuthenticationResult> getAuthenticationStatus();
}