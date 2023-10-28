import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart' as app_colors;

final darkTextTheme = TextTheme(
  titleLarge: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  bodySmall: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  ),
).apply(
  displayColor: app_colors.white,
  bodyColor: app_colors.white,
);

final lightTextTheme = darkTextTheme.apply(
  displayColor: app_colors.blackPearl,
  bodyColor: app_colors.gray,
);
