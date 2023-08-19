import 'package:flutter/material.dart';

import '../style_helpers.dart';

extension ContextExtensions on BuildContext {
  AppColors get colors {
    return AppColors(this);
  }

  AppFonts get fonts {
    return AppFonts(this);
  }
}
