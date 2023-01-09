import 'dart:async';
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_production_boilerplate/config/theme.dart';
import 'package:flutter_production_boilerplate/splash/splash.dart';
import 'package:flutter_production_boilerplate/ui/screens/intro/intro_screen.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';

import 'authentication/bloc/authentication_bloc.dart';
import 'cubit/theme/theme_cubit.dart';
import 'route/router.dart';
import 'route/router.dart' as route;
import 'ui/screens/dashboard/dashboard_screen.dart';

/// Try using const constructors as much as possible!

void main() async {
  /// Initialize packages
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  final Directory tmpDir = await getTemporaryDirectory();
  Hive.init(tmpDir.toString());
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: tmpDir,
  );

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  final UserRepository userRepository = UserRepository();

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
        child: MyApp(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            userRepository: userRepository,
          ),
        ),
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

            onGenerateRoute: SfRouter.generateRoute,

            /// Localization stuff
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const IntroScreen(),
          );
        },
      ),
    );

    // return RepositoryProvider.value(
    //   value: authenticationRepository,
    //   child: BlocProvider<ThemeCubit>(
    //     create: (BuildContext context) => ThemeCubit(),
    //     child: BlocBuilder<ThemeCubit, ThemeModeState>(
    //       builder: (BuildContext context, ThemeModeState state) {
    //         return MaterialApp(
    //           /// Localization is not available for the title.
    //           // title: 'Flutter Production Boilerplate',

    //           /// Theme stuff
    //           theme: lightTheme,
    //           darkTheme: darkTheme,
    //           themeMode: state.themeMode,

    //           /// Localization stuff
    //           localizationsDelegates: context.localizationDelegates,
    //           supportedLocales: context.supportedLocales,
    //           locale: context.locale,
    //           debugShowCheckedModeBanner: false,
    //           home: const IntroScreen(),
    //           onGenerateRoute: SfRouter.generateRoute,
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
