import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'auth/login_page.dart';

class MoneyControllApp extends StatelessWidget {
  const MoneyControllApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appTheme,
      child: const LoginPage(),
    );
  }
}
