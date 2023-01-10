import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/dashboard_cubit.dart';
import '../../widgets/app_bar/app_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: BlocProvider<DashboardCubit>(
        create: (BuildContext context) => DashboardCubit(),
        child: const SafeArea(
          child: Scaffold(
            appBar: SfAppBarWidget(
              title: 'Help',
            ),
          ),
        ),
      ),
    );
  }
}
