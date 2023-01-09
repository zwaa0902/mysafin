import 'package:flutter/material.dart';

/// Colors from Tailwind CSS (v3.0) - June 2022
///
/// https://tailwindcss.com/docs/customizing-colors
///

class AppColor {
  AppColor._();

  static const Color transparent = Colors.transparent;
  static const Color primary900 = Color(0xffC1711A);
  static const Color primary800 = Color(0xffF47724);
  static const Color primary600 = Color(0xffF79428);
  static const Color primary500 = Color(0xffF8A32B);
  static const Color primary400 = Color(0xffFFAC30);
  static const Color primary300 = Color(0xffFBCB41);

  static const Color secondary900 = Color(0xff171822);
  static const Color secondary800 = Color(0xff1B1D28);
  static const Color secondary700 = Color(0xff211B48);
  static const Color secondary600 = Color(0xff2F2762);
  static const Color secondary500 = Color(0xff283463);
  static const Color secondary400 = Color(0xff464F77);
  static const Color secondary300 = Color(0xff636C8C);
  static const Color secondary200 = Color(0xff8D94AC);
  static const Color secondary100 = Color(0xffB9BECE);
  static const Color secondary50 = Color(0xffE3E5EB);
  static const Color shadowBottomBarHome = Color(0xff010049);

  //Neutrals
  static const Color neutrals1000 = neutrals900;
  static const Color neutrals900 = Color(0xff212330);
  static const Color neutrals800 = Color(0xff2C2C2E);
  static const Color neutrals700 = Color(0xff3A3A3C);
  static const Color neutrals600 = Color(0xff48484A);
  static const Color neutrals50 = Color(0xffF2F2F7);
  static final Color neutrals0 = neutrals900.withOpacity(0.2);
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral100 = Color(0xFFE5E5EA);
  static const Color neutral200 = Color(0xFFD1D1D6);
  static const Color neutral600 = Color(0xFF979797);

//Semantic
  static const Color success500 = Color(0xff00A369);
  static const Color success400 = Color(0xff22B17F);
  static const Color success300 = Color(0xff57BE95);
  static const Color success200 = Color(0xff8BD0B2);

  static const Color error700 = Color(0xffD8281E);
  static const Color error600 = Color(0xffEA3223);
  static const Color error300 = Color(0xffEB7069);
  static const Color error200 = Color(0xffF49893);
  static const Color error100 = Color(0xffFCD2DF);

  static const Color noti700 = Color(0xff1B7BCB);
  static const Color noti600 = Color(0xff248DDD);
  static const Color noti400 = Color(0xff49A8ED);
  static const Color noti300 = Color(0xff69B8EF);
  static const Color noti500 = Color(0xff2B9AEA);

  static const Color warning700 = Color(0xffF5C144);
  static const Color warning800 = Color(0xffF1A93C);

  //Extend
  static const Color teal600 = Color(0xff17A2B8);
  static const Color teal500 = Color(0xff19B2CB);
  static const Color teal300 = Color(0xff4EC8DB);
  static const Color teal100 = Color(0xffB1E8F0);
  static const Color teal50 = Color(0xffDAF0F6);
  static const Color lightSteel = Color(0xffF5F8FE);
  static const Color greyKeyboard = Color(0xffE2E6F2);
  static const Color grey600 = Color(0xff7E7E7E);
  static const Color grey500 = Color(0xff7B7F9E);
  static const Color grey60 = Color(0xffEDF1F6);

  static const Color grey50 = Color(0xffffffff);
  static const Color grey30 = Color(0xFFF1F3F6);
  static const Color grey10 = Color(0xFFF7FAFC);
}

const Color errorColor = Color(0xFFDC2626); // red-600

final ColorScheme lightColorScheme = ColorScheme.light(
  primary: AppColor.secondary600,
  secondary: AppColor.primary400,
  onSecondary: Colors.white,
  error: errorColor,
  background: AppColor.grey10,
  onBackground: AppColor.grey60,
  onSurface: AppColor.secondary600,
  surface: AppColor.secondary100,
  surfaceVariant: Colors.white,
  shadow: AppColor.secondary500.withOpacity(.1),
);

final ColorScheme darkColorScheme = ColorScheme.dark(
  primary: AppColor.primary600,
  secondary: AppColor.secondary600,
  onSecondary: Colors.white,
  error: errorColor,
  background: AppColor.secondary900,
  onBackground: AppColor.neutrals900,
  onSurface: AppColor.secondary900,
  surface: AppColor.secondary900,
  surfaceVariant: AppColor.secondary900,
  shadow: AppColor.secondary900.withOpacity(.2),
);

final ThemeData lightTheme = ThemeData(
  cardColor: AppColor.secondary600,
  colorScheme: lightColorScheme,
  fontFamily: 'Nunito',
  toggleableActiveColor: AppColor.secondary600,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    displayMedium: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    displaySmall: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    headlineLarge: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    headlineMedium: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    headlineSmall: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    titleLarge: TextStyle(
      color: AppColor.secondary700,
      fontFamily: 'Nunito',
    ),
    titleMedium: TextStyle(
      color: AppColor.secondary700,
      fontFamily: 'Nunito',
    ),
    titleSmall: TextStyle(
      color: AppColor.secondary700,
      fontFamily: 'Nunito',
    ),
    bodyLarge: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    bodyMedium: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    bodySmall: TextStyle(
      color: AppColor.secondary800,
      fontFamily: 'Nunito',
    ),
    labelLarge: TextStyle(
      color: AppColor.grey600,
      fontFamily: 'Nunito',
    ),
    labelMedium: TextStyle(
      color: AppColor.grey600,
      fontFamily: 'Nunito',
    ),
    labelSmall: TextStyle(
      color: AppColor.grey600,
      fontFamily: 'Nunito',
    ),
  ),
);

final ThemeData darkTheme = lightTheme.copyWith(
  colorScheme: darkColorScheme,
  toggleableActiveColor: AppColor.primary400,
  cardColor: AppColor.primary600,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColor.neutral0,
      fontFamily: 'Nunito',
    ),
    displayMedium: TextStyle(
      color: AppColor.neutral0,
      fontFamily: 'Nunito',
    ),
    displaySmall: TextStyle(
      color: AppColor.neutral0,
      fontFamily: 'Nunito',
    ),
    headlineLarge: TextStyle(
      color: AppColor.neutral0,
      fontFamily: 'Nunito',
    ),
    headlineMedium: TextStyle(
      color: AppColor.neutral0,
      fontFamily: 'Nunito',
    ),
    headlineSmall: TextStyle(
      color: AppColor.neutral0,
      fontFamily: 'Nunito',
    ),
    titleLarge: TextStyle(
      color: AppColor.grey10,
      fontFamily: 'Nunito',
    ),
    titleMedium: TextStyle(
      color: AppColor.grey10,
      fontFamily: 'Nunito',
    ),
    titleSmall: TextStyle(
      color: AppColor.grey10,
      fontFamily: 'Nunito',
    ),
    bodyLarge: TextStyle(
      color: AppColor.grey10,
      fontFamily: 'Nunito',
    ),
    bodyMedium: TextStyle(
      color: AppColor.grey10,
      fontFamily: 'Nunito',
    ),
    bodySmall: TextStyle(
      color: AppColor.grey10,
      fontFamily: 'Nunito',
    ),
    labelLarge: TextStyle(
      color: AppColor.grey600,
      fontFamily: 'Nunito',
    ),
    labelMedium: TextStyle(
      color: AppColor.grey600,
      fontFamily: 'Nunito',
    ),
    labelSmall: TextStyle(
      color: AppColor.grey600,
      fontFamily: 'Nunito',
    ),
  ),
);
