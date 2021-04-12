import 'package:flutter/material.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/features/authentication/presentation/widgets/footer_text.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LocaleBundle _localeBundle = Localization.of(context)!.bundle!;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: PageHeader(
                title: _localeBundle.registerPageTitle,
                subtitle: _localeBundle.registerPageSubtitle,
              ),
            ),
            SizedBox(
              height: 56.0,
            ),
            InputField(labelText: _localeBundle.email, controller: _emailController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 21.0),
              child: InputField(labelText: _localeBundle.password, controller: _passwordController),
            ),
            InputField(labelText: _localeBundle.repeatPassword, controller: _repeatPasswordController),
            Expanded(flex: 11, child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: SubmitButton(buttonLabel: _localeBundle.register),
              ),
            ),
            Expanded(flex: 1, child: SizedBox.shrink()),
            FooterText(
                questionText: _localeBundle.alreadyAMemberQuestion,
                clickableText: _localeBundle.logIn,
                onTextClicked: () => {}),
            Expanded(flex: 7, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
