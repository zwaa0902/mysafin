import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/dashboard_cubit.dart';

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
              appBar: AppBar(
            title: Text('Settings'),
          )),
        ),
      ),
    );
  }
}
