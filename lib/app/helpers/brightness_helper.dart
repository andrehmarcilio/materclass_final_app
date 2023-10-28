import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

extension BrightnessHelper on Brightness {
  ThemeMode get themeMode {
    if (this == Brightness.dark) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  SystemUiOverlayStyle toSystemUIOverlayStyle() {
    if (this == Brightness.light) {
      return SystemUiOverlayStyle.dark;
    } else {
      return SystemUiOverlayStyle.light;
    }
  }

  static Brightness fromName(String name) {
    return Brightness.values.firstWhere((brightness) => brightness.name == name);
  }

  static Brightness fromSystem() {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }
}
