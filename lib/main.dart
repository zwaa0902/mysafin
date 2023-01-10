import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'config/theme.dart';
import 'cubit/menu/menu_cubit.dart';
import 'cubit/theme/theme_cubit.dart';
import 'data/models/user_model.dart';
import 'data/repository/authentication_repository.dart';
import 'route/router.dart';
import 'ui/screens/dashboard/dashboard_page.dart';
import 'ui/screens/intro/intro_screen.dart';

/// Try using const constructors as much as possible!

void main() async {
  /// Initialize packages
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  await AuthenticationRepository.sharedInstance.load();

  final Directory tmpDir = await getTemporaryDirectory();
  Hive.init(tmpDir.toString());
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: tmpDir,
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const <Locale>[
          Locale('en'),
          Locale('de'),
        ],
        fallbackLocale: const Locale('en'),
        useFallbackTranslations: true,
        child: MyApp(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<MenuCubit>(
          create: (_) => MenuCubit(),
        ),
        // BlocProvider<LoginCubit>(
        //   create: (_) => LoginCubit(),
        // ),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(AuthSuccessState(
              userModel: UserModel.fromJson(AuthenticationRepository
                  .sharedInstance.loginInfo['user'] as Map<String, dynamic>))),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (BuildContext context, ThemeModeState state) {
          return MaterialApp(
            /// Localization is not available for the title.
            // title: 'Flutter Production Boilerplate',

            /// Theme stuff
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,

            /// Localization stuff
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: (AuthenticationRepository.sharedInstance.loginInfo['user'] !=
                    null)
                ? const DashboardPage()
                : const IntroScreen(),
            onGenerateRoute: SfRouter.generateRoute,
          );
        },
      ),
    );
  }
}
