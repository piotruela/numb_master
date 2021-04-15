import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numb_master/core/config/app_colors.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/core/util/field_validators.dart';
import 'package:numb_master/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:numb_master/features/authentication/presentation/widgets/authentication_page.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LocaleBundle _localeBundle = Localization.of(context)!.bundle!;
    return AuthenticationPage(
      pageTitle: _localeBundle.loginPageTitle,
      pageSubtitle: _localeBundle.loginPageSubtitle,
      formKey: formKey,
      inputFields: _buildInputFields(_localeBundle),
      submitButtonLabel: _localeBundle.logIn,
      submitButtonOnPressed: _buildOnSubmitPressed(context),
      footerQuestion: _localeBundle.youDontHaveAnAccountQuestion,
      footerActionText: _localeBundle.signUp,
      footerNavigateToPage: RegistrationPageRoute(),
      extraButton: _buildLoginWithFacebookButton(context, _localeBundle),
    );
  }

  List<Widget> _buildInputFields(LocaleBundle localeBundle) {
    return [
      InputField(
        labelText: localeBundle.email,
        controller: emailController,
        validator: Validators.emailValidator,
      ),
      InputField(
        labelText: localeBundle.password,
        controller: passwordController,
        validator: Validators.passwordValidator,
      ),
    ];
  }

  Function() _buildOnSubmitPressed(BuildContext context) {
    return () => BlocProvider.of<AuthenticationBloc>(context).add(
          LoginFormSubmitted(
            email: emailController.text,
            password: passwordController.text,
            isFormValid: formKey.currentState!.validate(),
          ),
        );
  }

  Widget _buildLoginWithFacebookButton(BuildContext context, LocaleBundle localeBundle) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Theme(
          data: Theme.of(context).copyWith(buttonColor: AppColors.faceBookColor),
          child: SubmitButton(
            buttonLabel: localeBundle.loginWithFacebook,
            labelColor: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
