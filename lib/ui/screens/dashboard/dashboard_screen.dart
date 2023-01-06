import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme.dart';
import '../../widgets/buttons/icon_button.dart';
import '../../widgets/height.dart';
import '../../widgets/width.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: menuBar(context),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  const Height(16),
                  totalBalance(context),
                  const Height(16),
                  availableBalance(context),
                ],
              ),
            ),
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
          STokenIconButton(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
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
}
