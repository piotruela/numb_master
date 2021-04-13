import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/presentation/widgets/unfocused_widget.dart';
import 'package:numb_master/core/util/field_validators.dart';
import 'package:numb_master/features/authentication/presentation/bloc/registration/registration_bloc.dart';
import 'package:numb_master/features/authentication/presentation/widgets/footer_text.dart';
import 'package:numb_master/features/authentication/presentation/widgets/input_field.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LocaleBundle _localeBundle = Localization.of(context)!.bundle!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: UnfocusedWidget(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: PageHeader(
                  title: _localeBundle.registerPageTitle,
                  subtitle: _localeBundle.registerPageSubtitle,
                ),
              ),
              BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  print(describeEnum(state.type));
                  return Text(describeEnum(state.type));
                },
              ),
              SizedBox(height: 56.0),
              InputField(
                labelText: _localeBundle.email,
                controller: _emailController,
                validator: Validators.emailValidator,
              ),
              SizedBox(height: 21.0),
              InputField(
                labelText: _localeBundle.password,
                controller: _passwordController,
                validator: Validators.passwordValidator,
              ),
              SizedBox(height: 21.0),
              InputField(
                labelText: _localeBundle.repeatPassword,
                controller: _repeatPasswordController,
                validator: (value) => Validators.repeatPasswordValidator(value, _passwordController.text),
              ),
              Expanded(flex: 11, child: SizedBox.shrink()),
              _buildSubmitButton(context, _localeBundle),
              Expanded(flex: 1, child: SizedBox.shrink()),
              FooterText(
                  questionText: _localeBundle.alreadyAMemberQuestion,
                  clickableText: _localeBundle.logIn,
                  onTextClicked: () => {}),
              Expanded(flex: 7, child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, LocaleBundle localeBundle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: SubmitButton(
          buttonLabel: localeBundle.register,
          onPressed: () {
            BlocProvider.of<RegistrationBloc>(context).add(
              FormSubmitted(
                email: _emailController.text,
                password: _passwordController.text,
                repeatPassword: _repeatPasswordController.text,
                isFormValid: formKey.currentState!.validate(),
              ),
            );
          },
        ),
      ),
    );
  }
}
