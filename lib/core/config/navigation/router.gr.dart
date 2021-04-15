// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:numb_master/features/authentication/presentation/pages/login_page.dart'
    as _i5;
import 'package:numb_master/features/authentication/presentation/pages/registration_page.dart'
    as _i4;
import 'package:numb_master/features/authentication/presentation/pages/splash_page.dart'
    as _i2;
import 'package:numb_master/features/authentication/presentation/pages/welcome_page.dart'
    as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.SplashPage());
    },
    WelcomePageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.WelcomePage());
    },
    RegistrationPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.RegistrationPage());
    },
    LoginPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i5.LoginPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashPageRoute.name, path: '/'),
        _i1.RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        _i1.RouteConfig(RegistrationPageRoute.name, path: '/registration-page'),
        _i1.RouteConfig(LoginPageRoute.name, path: '/login-page')
      ];
}

class SplashPageRoute extends _i1.PageRouteInfo {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

class WelcomePageRoute extends _i1.PageRouteInfo {
  const WelcomePageRoute() : super(name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

class RegistrationPageRoute extends _i1.PageRouteInfo {
  const RegistrationPageRoute() : super(name, path: '/registration-page');

  static const String name = 'RegistrationPageRoute';
}

class LoginPageRoute extends _i1.PageRouteInfo {
  const LoginPageRoute() : super(name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}
