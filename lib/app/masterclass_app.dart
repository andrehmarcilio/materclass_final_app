import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../modules/profile/ui/profile_page.dart';
import 'helpers/brightness_helper.dart';
import 'interactor/app_reducer.dart';
import 'theme/theme.dart' as app_theme;

class MasterclassApp extends StatefulWidget {
  const MasterclassApp({super.key});

  @override
  State<MasterclassApp> createState() => _MasterclassAppState();
}

class _MasterclassAppState extends State<MasterclassApp> {
  @override
  void initState() {
    super.initState();
    appStateAtom.addListener(_setSystemUIOverlayStyleByAppBrightness);
    SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged = _setSystemUIOverlayStyleByAppBrightness;
    appEventsAtom.add(GetSavedBrightnessMode());
  }

  @override
  void dispose() {
    appStateAtom.removeListener(_setSystemUIOverlayStyleByAppBrightness);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appStateAtom,
      builder: (context, state, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: app_theme.lightTheme,
          darkTheme: app_theme.darkTheme,
          themeMode: state.brightness?.themeMode ?? ThemeMode.system,
          home: const ProfilePage(),
        );
      },
    );
  }

  void _setSystemUIOverlayStyleByAppBrightness() {
    final brightness = appStateAtom.value.brightness ?? BrightnessHelper.fromSystem();
    SystemChrome.setSystemUIOverlayStyle(brightness.toSystemUIOverlayStyle());
  }
}
