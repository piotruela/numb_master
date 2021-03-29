import 'package:numb_master/core/config/localization/locale_bundle.dart';

class LocaleBundleEn extends LocaleBundle {
  @override
  String get welcomeTextPartOne => 'With this app you can learn\n'
      ' all the things you want and\n become a ';

  @override
  String get welcomeTextPartTwo => 'number master.';

  @override
  String get or => 'or';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get registerPageTitle => 'Create Account,';

  @override
  String get registerPageSubtitle => 'Sign up with email and password';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get repeatPassword => 'Repeat password';

  @override
  String get alreadyAMemberQuestion => 'Already a member? ';

  @override
  String get logIn => 'Log in';
}
