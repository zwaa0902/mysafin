import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_boilerplate/data/models/menu_item.dart';
import 'package:flutter_production_boilerplate/ui/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_production_boilerplate/ui/screens/help/help_screen.dart';
import 'package:flutter_production_boilerplate/ui/screens/profile/profile_screen.dart';
import 'package:flutter_production_boilerplate/ui/screens/settings/settings_screen.dart';
import 'package:flutter_production_boilerplate/ui/screens/transactions/transactions_screen.dart';

import '../../../cubit/menu/menu_cubit.dart';
import '../../../route/router.dart' as route;
import '../menu/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.currentItem = MenuItems.dashboard});

  final SfMenuItem currentItem;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
      default:
        return const DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(widget.currentItem),
      bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.background,
          child: bottomNav(context)),
    );
  }

  Widget bottomNav(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    final List<IconData> listIcon = <IconData>[
      Icons.home_rounded,
      Icons.person_rounded,
      Icons.favorite_rounded,
      Icons.settings_rounded,
    ];

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Container(
        margin: EdgeInsets.all(deviceWidth * 0.05),
        height: 52,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: BlocBuilder<MenuCubit, MenuState>(
          builder: (BuildContext context, MenuState state) {
            final int indexMenu = MenuItems.all.indexOf(state.sfMenuItem);
            final String menuTitle = MenuItems.all[indexMenu].title;
            return ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (_, int index) => InkWell(
                onTap: () => context.read<MenuCubit>().updateMenuItem(
                    MenuState(sfMenuItem: MenuItems.all[index])),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == indexMenu
                          ? deviceWidth * 0.32
                          : deviceWidth * 0.18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == indexMenu ? 40 : 0,
                        width: index == indexMenu
                            ? deviceWidth * 0.32
                            : deviceWidth * 0,
                        decoration: BoxDecoration(
                          color: index == indexMenu
                              ? Colors.blueAccent.withOpacity(0.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == indexMenu
                          ? deviceWidth * 0.32
                          : deviceWidth * 0.18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width:
                                    index == indexMenu ? deviceWidth * 0.1 : 0,
                              ),
                              AnimatedOpacity(
                                opacity: index == indexMenu ? 1 : 0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(
                                  index == indexMenu ? menuTitle : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.apply(
                                        fontWeightDelta: 2,
                                        color: index == indexMenu
                                            ? Colors.blueAccent.withOpacity(0.8)
                                            : Colors.transparent,
                                      ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == indexMenu
                                    ? deviceWidth * 0.03
                                    : 20,
                              ),
                              Icon(
                                listIcon[index],
                                size: 24,
                                color: index == indexMenu
                                    ? Colors.blueAccent
                                    : Colors.black26,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}