part of 'app_reducer.dart';

class AppState {
  final Brightness? brightness;

  const AppState([this.brightness]);

  AppState switchThemeBrightness() {
    var brightness = this.brightness;

    brightness ??= BrightnessHelper.fromSystem();

    if (brightness == Brightness.dark) {
      return copyWith(brightness: Brightness.light);
    }
    return copyWith(brightness: Brightness.dark);
  }

  AppState setThemeBrightness(Brightness brightness) {
    return copyWith(brightness: brightness);
  }

  AppState copyWith({Brightness? brightness}) {
    return AppState(brightness ?? this.brightness);
  }
}
