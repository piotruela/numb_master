import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numb_master/core/config/asset_config.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';

class WelcomePage extends StatelessWidget {
  final AssetConfig assetConfig = AssetConfig();

  @override
  Widget build(BuildContext context) {
    final LocaleBundle localeBundle = Localization.of(context)!.bundle!;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 300,
            child: SvgPicture.asset(assetConfig.graduationSvg),
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
                  children: <TextSpan>[
                TextSpan(text: localeBundle.welcomeTextPartOne),
                TextSpan(text: localeBundle.welcomeTextPartTwo, style: TextStyle(fontWeight: FontWeight.bold)),
              ])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavigateToRegisterButton(localeBundle: localeBundle),
                Text(
                  localeBundle.or,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                _NavigateToLoginButton(localeBundle: localeBundle)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NavigateToRegisterButton extends StatelessWidget {
  final LocaleBundle localeBundle;

  const _NavigateToRegisterButton({Key? key, required this.localeBundle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => AutoRouter.of(context).push(RegisterPageRoute()),
      child: Text(localeBundle.register),
    );
  }
}

class _NavigateToLoginButton extends StatelessWidget {
  final LocaleBundle localeBundle;

  const _NavigateToLoginButton({Key? key, required this.localeBundle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color> _buttonColor = MaterialStateProperty.all<Color>(Theme.of(context).buttonColor);

    return ElevatedButton(
      onPressed: () => {},
      style: ButtonStyle(
          foregroundColor: _buttonColor,
          shadowColor: _buttonColor,
          backgroundColor: _buttonColor,
          overlayColor: _buttonColor),
      child: Text(
        localeBundle.login,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
