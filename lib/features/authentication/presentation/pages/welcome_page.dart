import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numb_master/core/config/asset_config.dart';
import 'package:numb_master/core/config/localization/locale_bundle.dart';
import 'package:numb_master/core/config/localization/localization.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/injection_container.dart';

class WelcomePage extends StatelessWidget {
  final AssetConfig assetConfig = locator.get<AssetConfig>();

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
          _TextSection(localeBundle: localeBundle),
          _BottomSection(localeBundle: localeBundle)
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  final LocaleBundle localeBundle;

  const _TextSection({required this.localeBundle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
        children: <TextSpan>[
          TextSpan(text: localeBundle.welcomeTextPartOne),
          TextSpan(
            text: localeBundle.welcomeTextPartTwo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class _BottomSection extends StatelessWidget {
  final LocaleBundle localeBundle;

  const _BottomSection({required this.localeBundle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavigateToRegisterPageButton(localeBundle: localeBundle),
          Text(
            localeBundle.or,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          _NavigateToLoginPageButton(localeBundle: localeBundle)
        ],
      ),
    );
  }
}

class _NavigateToRegisterPageButton extends StatelessWidget {
  final LocaleBundle localeBundle;

  const _NavigateToRegisterPageButton({required this.localeBundle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => AutoRouter.of(context).push(RegisterPageRoute()),
      child: Text(localeBundle.register),
    );
  }
}

class _NavigateToLoginPageButton extends StatelessWidget {
  final LocaleBundle localeBundle;

  const _NavigateToLoginPageButton({required this.localeBundle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: _buildButtonStyle(context),
      child: Text(
        localeBundle.login,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(BuildContext context) {
    final _buttonColor = MaterialStateProperty.all<Color>(Theme.of(context).buttonColor);
    return ButtonStyle(
        foregroundColor: _buttonColor,
        shadowColor: _buttonColor,
        backgroundColor: _buttonColor,
        overlayColor: _buttonColor);
  }
}
