import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart' as app_colors;

final darkTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: app_colors.white,
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: app_colors.white,
  ),
  bodyLarge: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: app_colors.gray,
  ),
  bodySmall: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: app_colors.gray,
  ),
);

final lightTextTheme = darkTextTheme.apply(
  displayColor: app_colors.blackPearl,
  bodyColor: app_colors.gray,
);
