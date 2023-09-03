import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract interface class UserConfigStore {
  String? getString({required UserConfigKey userConfigKey});
  FutureOr<void> saveString({required UserConfigKey userConfigKey, required String value});
}

class UserConfigStoreIMPL implements UserConfigStore {
  final SharedPreferences sharedPreferences;

  UserConfigStoreIMPL({required this.sharedPreferences});

  @override
  String? getString({required UserConfigKey userConfigKey}) {
    return sharedPreferences.getString(userConfigKey.key);
  }

  @override
  Future<void> saveString({required UserConfigKey userConfigKey, required String value}) async {
    await sharedPreferences.setString(userConfigKey.key, value);
  }
}

enum UserConfigKey {
  /// Key to get the theme_mode prefered by user. It is a String (dark/light)
  themeMode('theme_mode');

  final String key;

  const UserConfigKey(this.key);
}
