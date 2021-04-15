
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource {
  Future<UserCredential> createAccount({required String email,required String password});
  Future<UserCredential> logIn({required String email,required String password});
  Future<void> logOut();
  User? getLoggedUserData();
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  final FirebaseAuth firebaseAuth;

  AuthenticationDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserCredential> createAccount({required String email,required String password}) async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> logIn({required String email, required String password}) async {
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  User? getLoggedUserData() {
    return firebaseAuth.currentUser;
  }
}