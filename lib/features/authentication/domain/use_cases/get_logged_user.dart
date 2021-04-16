import 'package:firebase_auth/firebase_auth.dart';
import 'package:numb_master/core/use_cases/use_cases.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';

class GetLoggedUser implements UseCase<User?, NoParams> {
  final AuthenticationRepository authenticationRepository;

  GetLoggedUser(this.authenticationRepository);

  @override
  User? call(NoParams params) {
    return authenticationRepository.getLoggedUser();
  }
}