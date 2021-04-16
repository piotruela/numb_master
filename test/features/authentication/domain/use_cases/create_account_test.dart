import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numb_master/core/error/failures.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart';

import '../repositories/authentication_repository_test.mocks.dart';

void main() {
  AuthenticationRepository? mockAuthenticationRepository;
  CreateAccount? createAccountUseCase;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    createAccountUseCase = CreateAccount(mockAuthenticationRepository!);
  });

  final String testUsername = 'username';
  final String testPassword = 'password';

  test('should return registered status when account created', () async {
    //arrange
    when(mockAuthenticationRepository!.createAccount(email: testUsername, password: testPassword))
        .thenAnswer((_) async => Right(AuthenticationResult.registered));

    //act
    final result = await createAccountUseCase!(Params(email: testUsername, password: testPassword));

    //assert
    expect(result, Right(AuthenticationResult.registered));
    verify(mockAuthenticationRepository!.createAccount(email: testUsername, password: testPassword)).called(1);
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });

  test('should return AuthenticationFailure and error code when creating account fails', () async {
    //arrange
    when(mockAuthenticationRepository!.createAccount(email: testUsername, password: testPassword))
        .thenAnswer((_) async => Left(AuthenticationFailure(failureCode: 'FAIL')));

    //act
    final result = await createAccountUseCase!(Params(email: testUsername, password: testPassword));

    //assert
    expect(result, Left(AuthenticationFailure(failureCode: 'FAIL')));
  });
}
