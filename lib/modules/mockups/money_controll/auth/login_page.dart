import 'package:flutter/material.dart';

import '../app_assets.dart';
import '../app_colors.dart';
import '../app_typography.dart';
import 'widgets/app_logo.dart';
import 'widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Center(child: AppLogo()),
            const SizedBox(height: 55),
            const Text(
              'Get your Money\nUnder Control',
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Manage your expenses. \nSeamlessly.',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            const CustomButton(
              backGroundColor: purple,
              child: Text(
                'Sign Up with Email ID',
                style: buttonTextStyle,
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              icon: Image.asset(
                googleIconPath,
                width: 24,
              ),
              child: Text('Sign Up with Google', style: buttonTextStyle.copyWith(color: Colors.black)),
            ),
            const SizedBox(height: 32),
            SafeArea(
              top: false,
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
