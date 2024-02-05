import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/app/interactor/app_atoms.dart';
import 'package:masterclass_final_app/app/interactor/app_reducer.dart';
import 'package:masterclass_final_app/app/interactor/app_service.dart';
import 'package:mocktail/mocktail.dart';

class AppServiceMock extends Mock implements AppService {}

void main() {
  late AppServiceMock appServiceMock;
  late AppReducer appReducer;
  setUp(() {
    registerFallbackValue(Brightness.dark);
    appStateAtom.value = const AppState(Brightness.light);
    appServiceMock = AppServiceMock();
    appReducer = AppReducer(appService: appServiceMock);
  });

  tearDown(() {
    appReducer.dispose();
  });
  group('AppReducer Unit Tests |', () {
    test('should change the state brightness when added SwitchBrightnessMode event', () {
      when(() => appServiceMock.savePreferedBrightnessMode(any())).thenAnswer((_) async {});
      final startAppStateBrightness = appStateAtom.value.brightness;

      appEventsAtom.add(SwitchBrightnessMode());

      expect(startAppStateBrightness, isNot(appStateAtom.value.brightness));
    });

    test('should change state to the saved brightness when added GetSavedBrightnessMode event', () {
      when(() => appServiceMock.getSavedBrightnessMode()).thenReturn(Brightness.dark);

      appEventsAtom.add(GetSavedBrightnessMode());

      expect(appStateAtom.value.brightness, Brightness.dark);
    });
  });
}
