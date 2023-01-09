import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/theme/theme_cubit.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    required this.mode,
    required this.icon,
  });

  final IconData icon;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (BuildContext context, ThemeModeState state) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: state.themeMode == mode
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            onTap: () => BlocProvider.of<ThemeCubit>(context).getTheme(
              ThemeModeState(themeMode: mode),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon,
                size: 32,
                color: state.themeMode != mode
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}
