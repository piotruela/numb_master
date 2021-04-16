import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/locale_bundle_en.dart';
import 'package:numb_master/features/authentication/domain/use_cases/create_account.dart';
import 'package:numb_master/features/authentication/domain/use_cases/get_authentication_status.dart';
import 'package:numb_master/features/authentication/domain/use_cases/get_logged_user.dart';
import 'package:numb_master/features/authentication/domain/use_cases/log_in.dart';
import 'package:numb_master/features/authentication/domain/use_cases/log_out.dart';
import 'package:numb_master/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:numb_master/features/authentication/presentation/pages/registration_page.dart';
import 'package:numb_master/features/authentication/presentation/widgets/footer_text.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';
import 'package:numb_master/injection_container.dart';

import '../../../../core/test_widget.dart';

class MockCreateAccount extends Mock implements CreateAccount {}

class MockGetAuthenticationStatus extends Mock implements GetAuthenticationStatus {}

class MockLogIn extends Mock implements LogIn {}

class MockLogOut extends Mock implements LogOut {}

class MockGetLoggedUser extends Mock implements GetLoggedUser {}

void main() {
  final LocaleBundle localeBundle = LocaleBundleEn();
  setupForTests();

  final Widget testWidget = TestWidget(
    child: BlocProvider(
      create: (context) => AuthenticationBloc(
          createAccount: MockCreateAccount(),
          getAuthenticationStatus: MockGetAuthenticationStatus(),
          logIn: MockLogIn(),
          logOut: MockLogOut(),
          getLoggedUser: MockGetLoggedUser()),
      child: RegistrationPage(),
    ),
  );

  testWidgets('should render with all necessary widgets and texts', (WidgetTester tester) async {
    //act
    await tester.pumpWidget(testWidget);

    //assert
    expect(find.widgetWithText(PageHeader, localeBundle.registerPageTitle), findsOneWidget);
    expect(find.widgetWithText(PageHeader, localeBundle.registerPageSubtitle), findsOneWidget);

    expect(find.byType(InputField), findsNWidgets(3));
    expect(find.widgetWithText(InputField, localeBundle.email), findsOneWidget);
    expect(find.widgetWithText(InputField, localeBundle.password), findsOneWidget);
    expect(find.widgetWithText(InputField, localeBundle.repeatPassword), findsOneWidget);

    expect(find.widgetWithText(SubmitButton, localeBundle.register), findsOneWidget);
    expect(find.byType(FooterText), findsOneWidget);
  });

  testWidgets('should allow to write to InputFields', (WidgetTester tester) async {
    //arrange
    final String emailInput = 'Email input';
    final String passwordInput = 'Password input';
    final String repeatPasswordInput = 'Repeat password input';

    await tester.pumpWidget(testWidget);

    expect(find.text(emailInput), findsNothing);
    expect(find.text(passwordInput), findsNothing);
    expect(find.text(repeatPasswordInput), findsNothing);

    //act
    await tester.enterText(find.widgetWithText(InputField, localeBundle.email), emailInput);
    await tester.enterText(find.widgetWithText(InputField, localeBundle.password), passwordInput);
    await tester.enterText(find.widgetWithText(InputField, localeBundle.repeatPassword), repeatPasswordInput);

    //assert
    expect(find.text(emailInput), findsOneWidget);
    expect(find.text(passwordInput), findsOneWidget);
    expect(find.text(repeatPasswordInput), findsOneWidget);
  });
}
