import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:numb_master/core/config/asset_config.dart';
import 'package:numb_master/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:numb_master/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:numb_master/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart';
import 'package:numb_master/features/authentication/presentation/bloc/registration/registration_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<AssetConfig>(AssetConfig());
  // Feature - authentication
  // Blocs
  locator.registerFactory(() => RegistrationBloc(createAccount: locator()));

  // Use cases
  locator.registerLazySingleton(() => CreateAccount(locator()));

  // Repository
  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      dataSource: locator(),
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
