import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:numb_master/core/config/asset_config.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/core/config/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final AssetConfig assetConfig = AssetConfig();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: AppTheme.themeData,
      localizationsDelegates: [
        const LocalizationDelegate(),
      ],
      supportedLocales: LocalizationDelegate.supportedLocales,
    );
  }
}
