import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/app/interactor/app_reducer.dart';

void main() {
  group('AppState Unit Tests |', () {
    test('should change brightness when invoke switchThemeBrightness and an initial brightness is provided', () {
      const lightState = AppState(Brightness.light);

      final expectedtedDarkState = lightState.switchThemeBrightness();

      expect(expectedtedDarkState.brightness, Brightness.dark);
    });

    testWidgets(
      'should change brightness when invoke switchThemeBrightness and an initial brightness is not provided',
      (tester) async {
        final platformBrightness = TestWidgetsFlutterBinding.instance.platformDispatcher.platformBrightness;
        const appState = AppState();

        final expectedtedChangedState = appState.switchThemeBrightness();

        expect(platformBrightness, isNot(expectedtedChangedState.brightness));
      },
    );

    test('should change brightness to the choosed value when invoke setThemeBrightnes', () {
      const lightState = AppState(Brightness.light);
      var expectedtedDarkState = lightState.setThemeBrightness(Brightness.dark);
      expect(expectedtedDarkState.brightness, Brightness.dark);

      const darkState = AppState(Brightness.dark);
      expectedtedDarkState = darkState.setThemeBrightness(Brightness.dark);
      expect(expectedtedDarkState.brightness, Brightness.dark);

      var expectedteLightState = lightState.setThemeBrightness(Brightness.light);
      expect(expectedteLightState.brightness, Brightness.light);

      expectedteLightState = darkState.setThemeBrightness(Brightness.light);
      expect(expectedteLightState.brightness, Brightness.light);
    });
  });
}
