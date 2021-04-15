import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numb_master/core/presentation/widgets/unfocused_widget.dart';
import 'package:numb_master/features/authentication/presentation/widgets/footer_text.dart';
import 'package:numb_master/features/authentication/presentation/widgets/page_header.dart';
import 'package:numb_master/core/util/extensions/list_extensions.dart';
import 'package:numb_master/features/authentication/presentation/widgets/submit_button.dart';

class AuthenticationPage extends StatelessWidget {
  final String pageTitle;
  final String pageSubtitle;
  final List<Widget> inputFields;
  final String submitButtonLabel;
  final Function() submitButtonOnPressed;
  final String footerQuestion;
  final String footerActionText;
  final PageRouteInfo footerNavigateToPage;
  final GlobalKey<FormState> formKey;
  final Widget? extraButton;

  const AuthenticationPage({
    required this.pageTitle,
    required this.pageSubtitle,
    required this.formKey,
    required this.inputFields,
    required this.submitButtonLabel,
    required this.submitButtonOnPressed,
    required this.footerQuestion,
    required this.footerActionText,
    required this.footerNavigateToPage,
    this.extraButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: UnfocusedWidget(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(flex: 3, child: SizedBox.shrink()),
              ...inputFields.separatedWith(SizedBox(height: 20.0)),
              Expanded(flex: 11, child: SizedBox.shrink()),
              _buildSubmitButton(context),
              extraButton ?? SizedBox.shrink(),
              Expanded(flex: 1, child: SizedBox.shrink()),
              _buildFooter(context),
              Expanded(flex: 7, child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: PageHeader(
        title: pageTitle,
        subtitle: pageSubtitle,
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: SubmitButton(
          buttonLabel: submitButtonLabel,
          onPressed: submitButtonOnPressed,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return FooterText(
      questionText: footerQuestion,
      clickableText: footerActionText,
      onTextClicked: () => AutoRouter.of(context).replace(footerNavigateToPage),
    );
  }
}
