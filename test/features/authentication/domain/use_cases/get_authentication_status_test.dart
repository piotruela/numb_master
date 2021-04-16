import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numb_master/core/use_cases/use_cases.dart';
import 'package:numb_master/features/authentication/domain/entities/authentication_result.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:numb_master/features/authentication/domain/use_cases/get_authentication_status.dart';

import '../repositories/authentication_repository_test.mocks.dart';

void main() {
  AuthenticationRepository? authenticationRepository;
  GetAuthenticationStatus? getAuthenticationStatus;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    getAuthenticationStatus = GetAuthenticationStatus(authenticationRepository!);
  });

  test('should return authentication status', () async {
    //arrange
    when(authenticationRepository!.getAuthenticationStatus()).thenAnswer((_) => AuthenticationResult.logged);

    //act
    final result = getAuthenticationStatus!(NoParams());

    //assert
    expect(result, AuthenticationResult.logged);
    verify(authenticationRepository!.getAuthenticationStatus()).called(1);
    verifyNoMoreInteractions(authenticationRepository);
  });
}
