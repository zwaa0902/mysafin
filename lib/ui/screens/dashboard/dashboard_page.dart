import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../data/models/menu_item.dart';
import '../menu/menu_screen.dart';
import 'dashboard_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  SfMenuItem currentItem = MenuItems.dashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: ZoomDrawer(
        mainScreen: const DashboardScreen(),
        menuScreen:
            MenuScreen(currentItem: currentItem, onSelectedItem: (item) {}),
      ),
    );
  }
}
