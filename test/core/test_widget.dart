import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/theme_config.dart';

Widget TestWidget({required Widget child}) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
      localizationsDelegates: [
        LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')],
      theme: AppTheme.themeData,
      home: child,
    ),
  );
}
