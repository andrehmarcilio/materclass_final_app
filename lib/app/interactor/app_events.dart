part of 'app_reducer.dart';

sealed class AppEvents {}

class SwitchBrightnessMode extends AppEvents {}

class GetSavedBrightnessMode extends AppEvents {}
