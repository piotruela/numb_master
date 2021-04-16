import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/core/presentation/widgets/app_snack_bar.dart';
import 'package:numb_master/core/util/field_validators.dart';
import 'package:numb_master/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:numb_master/features/authentication/presentation/widgets/authentication_page.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LocaleBundle localeBundle = Localization.of(context)!.bundle!;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.type == AuthenticationStateType.registered) {
          AutoRouter.of(context).push(DashboardPageRoute());
        } else if (state.type == AuthenticationStateType.failure) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar(label: localeBundle.registrationError));
        }
      },
      child: AuthenticationPage(
        pageTitle: localeBundle.registerPageTitle,
        pageSubtitle: localeBundle.registerPageSubtitle,
        formKey: formKey,
        inputFields: _buildInputFields(localeBundle),
        submitButtonLabel: localeBundle.register,
        submitButtonOnPressed: _buildOnPressed(context),
        footerQuestion: localeBundle.alreadyAMemberQuestion,
        footerActionText: localeBundle.logIn,
        footerNavigateToPage: LoginPageRoute(),
      ),
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
        obscureText: true,
      ),
      InputField(
        labelText: localeBundle.repeatPassword,
        controller: repeatPasswordController,
        validator: (value) => Validators.repeatPasswordValidator(value, passwordController.text),
        obscureText: true,
      )
    ];
  }

  Function() _buildOnPressed(BuildContext context) {
    return () => BlocProvider.of<AuthenticationBloc>(context).add(
          RegistrationFormSubmittedEvent(
            email: emailController.text,
            password: passwordController.text,
            repeatPassword: repeatPasswordController.text,
            isFormValid: formKey.currentState!.validate(),
          ),
        );
  }
}
