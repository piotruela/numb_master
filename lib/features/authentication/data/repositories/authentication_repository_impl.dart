import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, AuthenticationResult>> createAccount({required String email,required  String password}) async {
    try {
      await dataSource.createAccount(email: email, password: password);
      return Right(AuthenticationResult.registered);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(failureCode: e.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticationResult>> logIn({required String email, required String password}) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticationResult>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

}