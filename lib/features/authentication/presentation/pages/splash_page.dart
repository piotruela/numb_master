import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numb_master/core/config/asset_config.dart';
import 'package:numb_master/core/config/navigation/router.gr.dart';
import 'package:numb_master/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:numb_master/injection_container.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(CheckAuthenticationStatusEvent());
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.type) {
          case AuthenticationStateType.logged_out:
            AutoRouter.of(context).replace(WelcomePageRoute());
            break;
          case AuthenticationStateType.logged_in:
            AutoRouter.of(context).replace(DashboardPageRoute());
            break;
          default:
        }
      },
      child: _AppSplashScreen(),
    );
  }
}

class _AppSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: SvgPicture.asset(locator.get<AssetConfig>().appLogoSvg),
        ),
      ),
    );
  }
}
