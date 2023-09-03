import 'package:flutter/material.dart';

import '../../commons/atomic_bloc/bloc_reducer.dart';
import '../../commons/atomic_bloc/event_atom.dart';
import '../helpers/brightness_helper.dart';
import 'app_service.dart';

part 'app_atoms.dart';
part 'app_events.dart';
part 'app_state.dart';

class AppReducer extends BlocReducer<AppState, AppEvents> {
  final AppService _appService;

  AppReducer({required AppService appService})
      : _appService = appService,
        super(state: appStateAtom, eventsAtom: appEventsAtom) {
    on<SwitchBrightnessMode>(_switchBrightnessMode);
    on<GetSavedBrightnessMode>(_getSavedBrightnessMode);
  }

  void _switchBrightnessMode(SwitchBrightnessMode _) {
    emit(state.value.switchThemeBrightness());
    _appService.savePreferedBrightnessMode(state.value.brightness!);
  }

  void _getSavedBrightnessMode(GetSavedBrightnessMode _) {
    final savedBrightnessMode = _appService.getSavedBrightnessMode();

    if (savedBrightnessMode == null) return;

    emit(state.value.setThemeBrightness(savedBrightnessMode));
  }
}
