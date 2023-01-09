import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_boilerplate/ui/screens/menu/menu_screen.dart';
import 'package:flutter_production_boilerplate/ui/widgets/menu/menu_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../config/theme.dart';
import '../../../cubit/dashboard_cubit.dart';
import '../../widgets/buttons/icon_button.dart';
import '../../widgets/card/card_cash/card_cash_widget.dart';
import '../../widgets/height.dart';
import '../../widgets/list/list_card_avatar/list_card_avatar.dart';
import '../../widgets/width.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: BlocProvider<DashboardCubit>(
        create: (BuildContext context) => DashboardCubit(),
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: menuBar(context),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Height(16),
                    totalBalance(context),
                    const Height(16),
                    availableBalance(context),
                    const Height(16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     Text(
                    //       'Send Money',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyLarge!
                    //           .apply(fontWeightDelta: 2),
                    //     ),
                    //     SvgPicture.asset(
                    //       'assets/icons/send_money.svg',
                    //       width: 24,
                    //     )
                    //   ],
                    // ),
                    const Height(16),
                    Text(
                      'Cash',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(fontWeightDelta: 2),
                    ),
                    const Height(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CardCashWidget(
                          amount: '180,000',
                          icon: SvgPicture.asset('assets/icons/bank.svg'),
                          title: 'Income',
                        ),
                        const Width(25),
                        CardCashWidget(
                          amount: '180,000',
                          icon: SvgPicture.asset('assets/icons/wallet.svg'),
                          title: 'Expense',
                          color: AppColor.error100,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: bottomNav(context),
          ),
        ),
      ),
    );
  }

  Widget menuBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MenuWidget(),
          Text(
            'Dashboard',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.apply(fontWeightDelta: 3),
          ),
          const Width(44),
        ],
      ),
    );
  }

  Widget totalBalance(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/graphic_card_light.svg',
              ),
            ],
          ),
        ),
        Container(
          height: 180,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total balance',
                style: Theme.of(context).textTheme.titleMedium?.apply(
                      fontWeightDelta: 3,
                      color: AppColor.grey50,
                    ),
              ),
              const Height(16),
              Text(
                'Available',
                style: Theme.of(context).textTheme.headline4?.apply(
                      fontWeightDelta: 3,
                      color: AppColor.grey50,
                    ),
              ),
              const Height(24),
              Text(
                'See detail',
                style: Theme.of(context).textTheme.titleMedium?.apply(
                      fontWeightDelta: 3,
                      color: AppColor.grey50,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget availableBalance(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Budger for Octorber',
                style: Theme.of(context).textTheme.titleMedium?.apply(
                      fontWeightDelta: 3,
                      color: AppColor.grey50,
                    ),
              ),
              const Height(8),
              Text(
                'Cash Available',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      fontWeightDelta: 1,
                      color: AppColor.grey50,
                    ),
              ),
            ],
          ),
          Text(
            'Available',
            style: Theme.of(context).textTheme.headline6?.apply(
                  fontWeightDelta: 3,
                  color: AppColor.grey50,
                ),
          ),
        ],
      ),
    );
  }

  Widget bottomNav(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final List<String> listTitle = <String>[
      'Dashboard',
      'Transactions',
      'Settings',
      'Profile'
    ];

    final List<IconData> listIcon = <IconData>[
      Icons.home_rounded,
      Icons.favorite_rounded,
      Icons.settings_rounded,
      Icons.person_rounded,
    ];

    return Container(
      margin: EdgeInsets.all(deviceWidth * 0.05),
      height: 52,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocBuilder<DashboardCubit, int>(
        builder: (BuildContext context, int state) {
          return ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (_, int index) => InkWell(
              onTap: () => context.read<DashboardCubit>().updateIndex(index),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == state
                        ? deviceWidth * 0.32
                        : deviceWidth * 0.18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == state ? 40 : 0,
                      width:
                          index == state ? deviceWidth * 0.32 : deviceWidth * 0,
                      decoration: BoxDecoration(
                        color: index == state
                            ? Colors.blueAccent.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == state
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
                              width: index == state ? deviceWidth * 0.1 : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == state ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == state ? listTitle[index] : '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.apply(
                                      fontWeightDelta: 2,
                                      color: index == state
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
                              width: index == state ? deviceWidth * 0.03 : 20,
                            ),
                            Icon(
                              listIcon[index],
                              size: 24,
                              color: index == state
                                  ? Colors.blueAccent
                                  : Colors.black26,
                            )
                            // SvgPicture.asset(
                            //   'assets/icons/menu.svg',
                            //   width: 24,
                            //   color: index == state
                            //       ? Colors.blueAccent
                            //       : Colors.black26,
                            // ),
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
    );
  }
}
