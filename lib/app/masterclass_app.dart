import 'package:flutter/material.dart';

import '../modules/github_repos/github_repos_module.dart';
import 'theme/theme.dart' as app_theme;

class MasterclassApp extends StatelessWidget {
  const MasterclassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: app_theme.lightTheme,
      darkTheme: app_theme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const GithubReposModule(),
    );
  }
}
