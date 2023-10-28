import 'package:flutter/material.dart';

abstract class Shape {
  final Color color;
  final double width;
  final double height;
  final double borderRadius;

  const Shape({
    required this.color,
    required this.width,
    required this.height,
    required this.borderRadius,
  });
}

class Square extends Shape {
  const Square({
    required double size,
    required super.color,
    required super.borderRadius,
  }) : super(width: size, height: size);
}

class Circle extends Shape {
  const Circle({
    required double size,
    required super.color,
  }) : super(
          width: size,
          height: size,
          borderRadius: size / 2,
        );
}

class Rectangle extends Shape {
  const Rectangle({
    required super.color,
    required super.width,
    required super.height,
    required super.borderRadius,
  });
}
