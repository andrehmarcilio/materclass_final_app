import 'package:flutter/material.dart';

import 'reponsible_text_widget.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: ResponsibleTextWidget(
            text: 'facebook',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        ResponsibleTextWidget(
          text: 'O facebook  ajuda você a se concectar e compartilhar com as pessoas que fazem parte da sua vida.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
