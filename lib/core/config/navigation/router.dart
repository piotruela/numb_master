import 'package:auto_route/annotations.dart';
import 'package:numb_master/features/authentication/presentation/pages/login_page.dart';
import 'package:numb_master/features/authentication/presentation/pages/registration_page.dart';
import 'package:numb_master/features/authentication/presentation/pages/splash_page.dart';
import 'package:numb_master/features/authentication/presentation/pages/welcome_page.dart';
import 'package:numb_master/features/courses/presentation/pages/dashboard_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: WelcomePage),
  AutoRoute(page: RegistrationPage),
  AutoRoute(page: LoginPage),
  AutoRoute(page: DashboardPage),
])
class $AppRouter {}
