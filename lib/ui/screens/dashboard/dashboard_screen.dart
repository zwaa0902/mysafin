import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_production_boilerplate/ui/widgets/menu/menu_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme.dart';
import '../../../cubit/dashboard_cubit.dart';
import '../../widgets/app_bar/app_bar.dart';
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
            appBar: const SfAppBarWidget(title: 'Dashboard'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Send Money',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(fontWeightDelta: 2),
                        ),
                        SvgPicture.asset(
                          'assets/icons/send_money.svg',
                          width: 24,
                        )
                      ],
                    ),
                    // const SizedBox(
                    //     height: 180,
                    //     child: AvatarCardList(
                    //         sendMoneyList: ['Mike', 'Josh', 'Ashley'])),
                    const Height(12),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.primary400,
                                borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(16),
                            child: const Icon(
                              Icons.add,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
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
            // bottomNavigationBar: bottomNav(context),
          ),
        ),
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
