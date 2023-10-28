import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../widgets/background_container.dart';
import '../widgets/form_card.dart';

class SimpleLoginPage extends StatelessWidget {
  const SimpleLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const Scaffold(
        body: Stack(
          children: [
            BackgroundContainer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppLogo(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: FormCard(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
