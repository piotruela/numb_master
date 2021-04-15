import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource;

  AuthenticationRepositoryImpl({required this.authenticationDataSource});

  @override
  Future<Either<Failure, AuthenticationResult>> createAccount({required String email,required  String password}) async {
    try {
      await authenticationDataSource.createAccount(email: email, password: password);
      return Right(AuthenticationResult.registered);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(failureCode: e.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticationResult>> logIn({required String email, required String password}) async {
    try{
      await authenticationDataSource.logIn(email: email, password: password);
      return Right(AuthenticationResult.logged);
    } on FirebaseAuthException catch (e){
      return Left(AuthenticationFailure(failureCode: e.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticationResult>> logOut() async {
    await authenticationDataSource.logOut();
    return Right(AuthenticationResult.logged_out);
  }

  @override
  Either<Failure, AuthenticationResult> getAuthenticationStatus() {
    final result = authenticationDataSource.getLoggedUserData();
    if(result != null){
      return Right(AuthenticationResult.logged);
    }
    return Left(AuthenticationFailure());
  }

}