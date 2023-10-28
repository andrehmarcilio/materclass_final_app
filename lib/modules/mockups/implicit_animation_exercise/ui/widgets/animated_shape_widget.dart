import 'package:flutter/material.dart';

import '../../states/shapes.dart';

class AnimatedShapeWidget extends StatelessWidget {
  final Shape shape;
  final VoidCallback onTap;

  const AnimatedShapeWidget({
    required this.shape,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: shape.width,
        height: shape.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: shape.color,
          borderRadius: BorderRadius.circular(shape.borderRadius),
        ),
        duration: const Duration(seconds: 1),
        child: const Text('Clique aqui'),
      ),
    );
  }
}
