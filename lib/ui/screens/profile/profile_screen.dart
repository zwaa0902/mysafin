import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/theme.dart';
import '../../../cubit/dashboard_cubit.dart';
import '../../../cubit/login/login_cubit.dart';
import '../../widgets/app_bar/app_bar.dart';
import '../../widgets/height.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
              title: 'Profile',
            ),
            body: SafeArea(
                child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children: [
                        const Height(24),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.neutral100,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/send_money.svg',
                            height: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const Height(12),
                        Text(
                          'Scan your QR Code',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                          return Column(
                            children: [
                              Text(
                                state.userModel?.fullName ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.apply(
                                      fontWeightDelta: 2,
                                    ),
                              ),
                              const Height(5),
                              Text(state.userModel?.customerCode ?? '',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              const Height(12),
                            ],
                          );
                        }),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor.neutral0,
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset(
                            'assets/img/qr_code.png',
                            height: 200,
                          ),
                        ),
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
