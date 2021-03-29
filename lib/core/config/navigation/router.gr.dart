// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:numb_master/features/authentication/presentation/pages/register_page.dart'
    as _i3;
import 'package:numb_master/features/authentication/presentation/pages/welcome_page.dart'
    as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomePageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.WelcomePage());
    },
    RegisterPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.RegisterPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(WelcomePageRoute.name, path: '/'),
        _i1.RouteConfig(RegisterPageRoute.name, path: '/register-page')
      ];
}

class WelcomePageRoute extends _i1.PageRouteInfo {
  const WelcomePageRoute() : super(name, path: '/');

  static const String name = 'WelcomePageRoute';
}

class RegisterPageRoute extends _i1.PageRouteInfo {
  const RegisterPageRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}
