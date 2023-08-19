import 'package:flutter/material.dart';

import 'colors.dart' as app_colors;
import 'fonts.dart' as app_fonts;

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: app_colors.black,
  textTheme: app_fonts.darkTextTheme,
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
  scaffoldBackgroundColor: app_colors.vistaWhite,
  textTheme: app_fonts.lightTextTheme,
  colorScheme: const ColorScheme.light(
    primary: app_colors.blue,
    onPrimary: app_colors.white,
    surface: app_colors.white,
    onSurface: app_colors.white,
    onSurfaceVariant: app_colors.gray,
  ),
);
