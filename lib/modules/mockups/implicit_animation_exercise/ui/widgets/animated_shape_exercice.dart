import 'package:flutter/material.dart';

import '../../states/shapes.dart';
import 'animated_shape_widget.dart';

class AnimatedShapeExercice extends StatefulWidget {
  const AnimatedShapeExercice({super.key});

  @override
  State<AnimatedShapeExercice> createState() => _AnimatedShapeExerciceState();
}

class _AnimatedShapeExerciceState extends State<AnimatedShapeExercice> {
  static const circleShape = Circle(
    size: 100,
    color: Colors.blue,
    alginment: Alignment.bottomRight,
  );

  static const rectangleShape = Rectangle(
    width: 200,
    height: 100,
    borderRadius: 0,
    color: Colors.red,
    alginment: Alignment.topCenter,
  );

  static const squareShape = Square(
    size: 100,
    borderRadius: 2,
    color: Colors.purple,
    alginment: Alignment.bottomLeft,
  );

  Shape shape = circleShape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedAlign(
        alignment: shape.alginment,
        curve: Curves.elasticInOut,
        duration: const Duration(milliseconds: 1500),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AnimatedShapeWidget(
            shape: shape,
            onTap: () => setState(_changeShape),
          ),
        ),
      ),
    );
  }

  void _changeShape() {
    if (shape is Circle) {
      shape = rectangleShape;
    } else if (shape is Rectangle) {
      shape = squareShape;
    } else {
      shape = circleShape;
    }
  }
}
