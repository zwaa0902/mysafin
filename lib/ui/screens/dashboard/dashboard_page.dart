import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../cubit/menu/menu_cubit.dart';
import '../../../data/models/menu_item.dart';
import '../help/help_screen.dart';
import '../menu/menu_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';
import '../transactions/transactions_screen.dart';
import 'dashboard_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  SfMenuItem currentItem = MenuItems.dashboard;

  final zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: BlocBuilder<MenuCubit, MenuState>(
        builder: (_, MenuState state) {
          return ZoomDrawer(
            controller: zoomDrawerController,
            mainScreen: getScreen(state.sfMenuItem),
            menuScreen: const MenuScreen(),
          );
        },
      ),
    );
  }

  Widget getScreen(SfMenuItem currentItem) {
    switch (currentItem) {
      case MenuItems.dashboard:
        return const DashboardScreen();
      case MenuItems.profile:
        return const ProfileScreen();
      case MenuItems.transactions:
        return const TransactionsScreen();
      case MenuItems.settings:
        return const SettingsScreen();
      case MenuItems.help:
        return const HelpScreen();
      default:
        return const DashboardScreen();
    }
  }
}
