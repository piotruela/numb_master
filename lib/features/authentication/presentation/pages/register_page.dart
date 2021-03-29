import 'package:flutter/material.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LocaleBundle localeBundle = Localization.of(context)!.bundle!;
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: PageHeader(
              title: localeBundle.registerPageTitle,
              subtitle: localeBundle.registerPageSubtitle,
            ),
          ),
          SizedBox(
            height: 56.0,
          ),
          InputField(
              labelText: localeBundle.email, controller: emailController),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21.0),
            child: InputField(
                labelText: localeBundle.password,
                controller: passwordController),
          ),
          InputField(
              labelText: localeBundle.repeatPassword,
              controller: emailController),
          Expanded(flex: 11, child: SizedBox.shrink()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(width: double.infinity, child: SubmitButton()),
          ),
          Expanded(flex: 1, child: SizedBox.shrink()),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: localeBundle.alreadyAMemberQuestion,
                style: TextStyle(fontSize: 18.0, color: Colors.black)),
            TextSpan(
              text: localeBundle.logIn,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ])),
          Expanded(flex: 7, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
