import 'package:numb_master/core/config/localization/locale_bundle.dart';

class LocaleBundlePl extends LocaleBundle {
  @override
  String get welcomeTextPartOne => 'Z pomocą tej aplikacji możesz\n'
      ' nauczyć się każdego języka \n i otrzymać tytuł ';

  @override
  String get welcomeTextPartTwo => 'number master.';

  @override
  String get or => 'albo';

  @override
  String get register => 'Zarejestruj';

  @override
  String get login => 'Zaloguj';

  @override
  String get registerPageTitle => 'Stwórz konto,';

  @override
  String get registerPageSubtitle => 'Podaj swój email i hasło';

  @override
  String get email => 'Email';

  @override
  String get password => 'Hasło';

  @override
  String get repeatPassword => 'Powtórz hasło';

  @override
  String get alreadyAMemberQuestion => 'Masz już konto? ';

  @override
  String get logIn => 'Zaloguj się';

  @override
  String get invalidFieldValue => 'Błędna wartość pola';

  @override
  String get loginPageSubtitle => throw UnimplementedError();

  @override
  String get loginPageTitle => throw UnimplementedError();

  @override
  String get loginWithFacebook => throw UnimplementedError();

  @override
  String get signUp => throw UnimplementedError();

  @override
  String get youDontHaveAnAccountQuestion => throw UnimplementedError();
}
