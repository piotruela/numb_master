import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:numb_master/core/config/asset_config.dart';
import 'package:numb_master/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:numb_master/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart';
import 'package:numb_master/features/authentication/domain/use_cases/get_authentication_status.dart';
import 'package:numb_master/features/authentication/domain/use_cases/log_in.dart';
import 'package:numb_master/features/authentication/domain/use_cases/log_out.dart';
import 'package:numb_master/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<AssetConfig>(AssetConfig());
  // Feature - authentication
  // Blocs
  locator.registerFactory(
    () => AuthenticationBloc(
      createAccount: locator(),
      getAuthenticationStatus: locator(),
      logIn: locator(),
    ),
  );

  // Use cases
  locator.registerLazySingleton(() => CreateAccount(locator()));
  locator.registerLazySingleton(() => GetAuthenticationStatus(locator()));
  locator.registerLazySingleton(() => LogIn(locator()));
  locator.registerLazySingleton(() => LogOut(locator()));

  // Repository
  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationDataSource: locator(),
    ),
  );

  // Data source
  locator.registerLazySingleton<AuthenticationDataSource>(
    () => AuthenticationDataSourceImpl(firebaseAuth: FirebaseAuth.instance),
  );
}

void setupForTests() {
  locator.registerSingleton<AssetConfig>(AssetConfig());
}
