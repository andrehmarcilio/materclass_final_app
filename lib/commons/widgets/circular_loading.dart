import 'package:flutter/material.dart';

import '../mixins/test_mixin.dart';

class CircularLoading extends StatelessWidget with TestMixin {
  const CircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: isTesting ? 0 : null,
    );
  }
}
