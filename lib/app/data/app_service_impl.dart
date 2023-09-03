import 'package:flutter/material.dart';

import '../../utils/services/user_config_store.dart';
import '../helpers/brightness_helper.dart';
import '../interactor/app_service.dart';

class AppServiceIMPL implements AppService {
  final UserConfigStore userConfigStore;

  AppServiceIMPL({required this.userConfigStore});

  @override
  Brightness? getSavedBrightnessMode() {
    final themeBrightnessName = userConfigStore.getString(userConfigKey: UserConfigKey.themeMode);
    if (themeBrightnessName != null) {
      return BrightnessHelper.fromName(themeBrightnessName);
    }
    return null;
  }

  @override
  Future<void> savePreferedBrightnessMode(Brightness appBrightness) async {
    await userConfigStore.saveString(
      userConfigKey: UserConfigKey.themeMode,
      value: appBrightness.name,
    );
  }
}
