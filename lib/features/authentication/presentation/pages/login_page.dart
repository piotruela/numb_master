import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numb_master/core/config/app_colors.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/core/presentation/widgets/app_snack_bar.dart';
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
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.type == AuthenticationStateType.logged_in) {
          AutoRouter.of(context).push(DashboardPageRoute());
        } else if (state.type == AuthenticationStateType.failure) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(label: _localeBundle.loginError));
        }
      },
      child: AuthenticationPage(
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
      ),
    );
  }

  List<Widget> _buildInputFields(LocaleBundle localeBundle) {
    return [
      InputField(
        labelText: localeBundle.email,
        controller: emailController,
      ),
      InputField(
        labelText: localeBundle.password,
        controller: passwordController,
        obscureText: true,
      ),
    ];
  }

  Function() _buildOnSubmitPressed(BuildContext context) {
    return () => BlocProvider.of<AuthenticationBloc>(context).add(
          LoginFormSubmittedEvent(
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
