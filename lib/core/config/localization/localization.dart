import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/locale_bundle_en.dart';
import 'package:numb_master/core/config/localization/locale_bundle_pl.dart';

class Localization {
  final Locale locale;
  final Map<String, LocaleBundle> localeBundles;

  Localization(this.locale, this.localeBundles);

  static Localization? of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  LocaleBundle? get bundle => localeBundles[locale.languageCode];
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  static const List<String> supportedLanguages = ['en', 'pl'];
  static const List<Locale> supportedLocales = [Locale('en', 'pl')];

  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    Map<String, LocaleBundle> localeBundles = {
      'en': LocaleBundleEn(),
      'pl': LocaleBundlePl()
    };

    return SynchronousFuture<Localization>(Localization(locale, localeBundles));
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
