import 'package:flutter/material.dart';

abstract interface class AppService {
  Brightness? getSavedBrightnessMode();
  Future<void> savePreferedBrightnessMode(Brightness appBrightness);
}
