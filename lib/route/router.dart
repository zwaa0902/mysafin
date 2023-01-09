// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

import '../ui/screens/dashboard/dashboard_page.dart';
import '../ui/screens/dashboard/dashboard_screen.dart';
import '../ui/screens/intro/intro_screen.dart';
import '../ui/screens/login/login_screen.dart';

const String homePage = '/home';
const String introPage = '/intro';
const String loginPage = '/login';

class SfRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    FocusManager.instance.primaryFocus?.unfocus();
    switch (settings.name) {
      case introPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const IntroScreen(),
          settings: const RouteSettings(name: introPage),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DashboardPage(),
          settings: const RouteSettings(name: homePage),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
          settings: const RouteSettings(name: loginPage),
        );
      default:
        // ignore: only_throw_errors
        throw 'this route name does not exist';
    }
  }
}
