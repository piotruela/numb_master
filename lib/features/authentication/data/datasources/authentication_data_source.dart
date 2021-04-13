
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource {
  Future<UserCredential> createAccount({required String email,required String password});
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final FirebaseAuth firebaseAuth;

  AuthenticationDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserCredential> createAccount({required String email,required String password}) async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}