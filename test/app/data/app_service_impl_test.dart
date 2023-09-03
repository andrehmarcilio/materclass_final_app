import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/app/data/app_service_impl.dart';
import 'package:masterclass_final_app/utils/services/user_config_store.dart';
import 'package:mocktail/mocktail.dart';

class UserConfigStoreMock extends Mock implements UserConfigStore {
  final sharedPreferencesMock = <UserConfigKey, Object>{};

  @override
  FutureOr<void> saveString({required UserConfigKey userConfigKey, required String value}) {
    sharedPreferencesMock.addAll({userConfigKey: value});
  }
}

void main() {
  late UserConfigStoreMock userConfigStoreMock;
  late AppServiceIMPL appServiceIMPL;

  setUp(() {
    userConfigStoreMock = UserConfigStoreMock();
    appServiceIMPL = AppServiceIMPL(userConfigStore: userConfigStoreMock);
  });

  group('AppService Tests |', () {
    test(
      'should return brightness.dark when invoked getSavedBrightnessMode and userConfigStore returns dark',
      () {
        when(() => userConfigStoreMock.getString(userConfigKey: UserConfigKey.themeMode)) //
            .thenReturn('dark');

        final brightness = appServiceIMPL.getSavedBrightnessMode();

        expect(brightness, Brightness.dark);
      },
    );

    test(
      'should return brightness.light when invoked getSavedBrightnessMode before save in userConfigStore the light mode',
      () async {
        await appServiceIMPL.savePreferedBrightnessMode(Brightness.light);
        when(() => userConfigStoreMock.getString(userConfigKey: UserConfigKey.themeMode)) //
            .thenReturn(userConfigStoreMock.sharedPreferencesMock[UserConfigKey.themeMode] as String?);

        final brightness = appServiceIMPL.getSavedBrightnessMode();

        expect(brightness, Brightness.light);
      },
    );
  });
}
