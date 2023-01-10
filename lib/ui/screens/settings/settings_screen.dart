import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cubit/dashboard_cubit.dart';
import '../../../cubit/login/login_cubit.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/card/card_transfer/card_transfer_widget.dart';
import '../../widgets/height.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
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
            appBar: const SfAppBarWidget(
              title: 'Settings',
            ),
            body: SafeArea(
                child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Column(
                        children: <Widget>[
                          const Height(30),
                          if (state.userModel?.gender == Gender.male)
                            SvgPicture.asset(
                              'assets/icons/male_avatar.svg',
                              width: 100,
                            )
                          else if (state.userModel?.gender == Gender.female)
                            SvgPicture.asset(
                              'assets/icons/female_avatar.svg',
                              width: 100,
                            )
                          else
                            SvgPicture.asset(
                              'assets/icons/other_avatar.svg',
                              width: 100,
                            ),
                          const Height(12),
                          Text(
                            state.userModel?.fullName ?? '',
                            style:
                                Theme.of(context).textTheme.titleLarge?.apply(
                                      fontWeightDelta: 2,
                                    ),
                          ),
                          const Height(5),
                          Text(state.userModel?.customerCode ?? '',
                              style: Theme.of(context).textTheme.labelLarge),
                        ],
                      );
                    },
                  ),
                  const Height(6),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PROFILE',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const Height(12),
                        Text(
                          'Change password',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(fontWeightDelta: 2),
                        ),
                        const Height(12),
                        Text(
                          'Assets',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(fontWeightDelta: 2),
                        ),
                        const Height(12),
                        Text(
                          'Light mode / Dark mode',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(fontWeightDelta: 2),
                        ),
                      ],
                    ),
                  ),
                  const Height(16),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'WALLET',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const Height(12),
                        Text(
                          'Contact Us',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(fontWeightDelta: 2),
                        ),
                        const Height(12),
                        Text(
                          'Help',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(fontWeightDelta: 2),
                        ),
                        const Height(20),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
