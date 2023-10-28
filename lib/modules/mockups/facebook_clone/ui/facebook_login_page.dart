import 'package:flutter/material.dart';

import 'widgets/login_form_card.dart';
import 'widgets/responsible_flex_widget.dart';
import 'widgets/welcome_text.dart';

class FacebookLoginPage extends StatelessWidget {
  const FacebookLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: ResponsibleFlexWidget(
            children: [
              SizedBox.square(dimension: 32),
              Padding(
                padding: EdgeInsets.all(16),
                child: WelcomeText(),
              ),
              SizedBox.square(dimension: 16),
              LoginFormCard(),
              SizedBox.square(dimension: 40),
            ],
          ),
        ),
      ),
    );
  }
}
