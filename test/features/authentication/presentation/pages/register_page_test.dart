import 'package:flutter_test/flutter_test.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/locale_bundle_en.dart';
import 'package:numb_master/features/authentication/presentation/pages/register_page.dart';
import 'package:numb_master/features/authentication/presentation/widgets/footer_text.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';

import '../../../../core/test_widget.dart';

void main() {
  final LocaleBundle localeBundle = LocaleBundleEn();

  testWidgets('should render with all necessary widgets and texts', (WidgetTester tester) async {
    //act
    await tester.pumpWidget(TestWidget(child: RegisterPage()));

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

    await tester.pumpWidget(TestWidget(child: RegisterPage()));
    await tester.pumpAndSettle();

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
