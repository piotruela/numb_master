import 'package:auto_route/annotations.dart';
import 'package:numb_master/features/authentication/presentation/pages/register_page.dart';
import 'package:numb_master/features/authentication/presentation/pages/welcome_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: WelcomePage, initial: true),
  AutoRoute(page: RegisterPage),
])
class $AppRouter {}
