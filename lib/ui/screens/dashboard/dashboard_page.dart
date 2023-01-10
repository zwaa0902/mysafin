import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_boilerplate/ui/screens/home/home_screen.dart';
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
            mainScreen: HomeScreen(
              currentItem: state.sfMenuItem,
            ),
            menuScreen: const MenuScreen(),
          );
        },
      ),
      // bottomNavigationBar: bottomNav(context),
      // bottomNavigationBar: SizedBox(),
    );
  }
}
