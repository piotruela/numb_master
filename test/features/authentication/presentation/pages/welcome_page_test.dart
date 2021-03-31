import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/locale_bundle_en.dart';
import 'package:numb_master/features/authentication/presentation/pages/welcome_page.dart';

import '../../../../core/test_widget.dart';

void main() {
  final LocaleBundle localeBundle = LocaleBundleEn();

  testWidgets('should render with all widgets and texts', (WidgetTester tester) async {
    //act
    await tester.pumpWidget(TestWidget(child: WelcomePage()));

    //assert
    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, localeBundle.register), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, localeBundle.login), findsOneWidget);
    expect(find.text(localeBundle.or), findsOneWidget);
  });
}
