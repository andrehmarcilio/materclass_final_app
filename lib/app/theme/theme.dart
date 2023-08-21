import 'package:flutter/material.dart';

import 'colors.dart' as app_colors;
import 'fonts.dart' as app_fonts;

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: app_fonts.darkTextTheme,
  elevatedButtonTheme: _elevationButtonTheme,
  scaffoldBackgroundColor: app_colors.black,
  colorScheme: const ColorScheme.dark(
    primary: app_colors.blue,
    onPrimary: app_colors.white,
    surface: app_colors.blackPearl,
    onSurface: app_colors.white,
    onSurfaceVariant: app_colors.gray,
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: app_fonts.lightTextTheme,
  elevatedButtonTheme: _elevationButtonTheme,
  scaffoldBackgroundColor: app_colors.vistaWhite,
  colorScheme: const ColorScheme.light(
    primary: app_colors.blue,
    onPrimary: app_colors.white,
    surface: app_colors.white,
    onSurface: app_colors.blackPearl,
    onSurfaceVariant: app_colors.gray,
  ),
);

final _elevationButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: const MaterialStatePropertyAll(0),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 32, vertical: 8),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    ),
  ),
);
