import 'package:flutter/material.dart';
import 'package:masterclass_final_app/app/theme/theme.dart' as app_theme;

class FlutterandoAppMock extends StatelessWidget {
  final Widget? view;

  const FlutterandoAppMock({super.key, this.view});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: app_theme.lightTheme,
      darkTheme: app_theme.darkTheme,
      themeMode: ThemeMode.dark,
      home: view,
    );
  }
}
