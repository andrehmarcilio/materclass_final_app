import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ResponsibleTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const ResponsibleTextWidget({required this.text, super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Text(
      text,
      style: style,
      textAlign: width > largestWidth ? TextAlign.left : TextAlign.center,
    );
  }
}
