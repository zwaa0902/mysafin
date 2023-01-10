// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

import '../ui/screens/dashboard/dashboard_page.dart';
import '../ui/screens/dashboard/dashboard_screen.dart';
import '../ui/screens/intro/intro_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/profile/profile_screen.dart';
import '../ui/screens/settings/settings_screen.dart';

const String homePage = '/home';
const String introPage = '/intro';
const String loginPage = '/login';
const String settingsPage = '/settings';
const String profilePage = '/profile';
const String helpPage = '/help';
const String transactionsPage = '/transaction';

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
      case settingsPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SettingsScreen(),
          settings: const RouteSettings(name: settingsPage),
        );
      case profilePage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileScreen(),
          settings: const RouteSettings(name: profilePage),
        );
      case transactionsPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileScreen(),
          settings: const RouteSettings(name: transactionsPage),
        );
      case helpPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileScreen(),
          settings: const RouteSettings(name: helpPage),
        );
      default:
        // ignore: only_throw_errors
        throw 'this route name does not exist';
    }
  }
}
