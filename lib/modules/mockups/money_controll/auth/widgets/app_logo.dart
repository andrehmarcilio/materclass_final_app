import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../states/shape.dart';
import '../utils/mixins/complete_state_mixin.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with CompleteStateMixin {
  Shape squareState = const Square(size: 60, color: purple, borderRadius: 0);
  Shape circleState = const Square(size: 60, color: purple, borderRadius: 0);
  Shape rectangleState = const Rectangle(height: 120, width: 60, color: purple, borderRadius: 0);

  @override
  void completeState() {
    squareState = const Square(size: 60, color: purple, borderRadius: 60);
    circleState = const Circle(size: 60, color: purple);
    rectangleState = const Rectangle(height: 120, width: 60, color: purple, borderRadius: 60);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              width: circleState.width,
              height: circleState.width,
              decoration: BoxDecoration(
                color: circleState.color,
                borderRadius: BorderRadius.circular(circleState.borderRadius),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              width: squareState.width,
              height: squareState.width,
              decoration: BoxDecoration(
                color: squareState.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(squareState.borderRadius),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          width: rectangleState.width,
          height: rectangleState.height,
          decoration: BoxDecoration(
            color: rectangleState.color,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(rectangleState.borderRadius),
              topRight: Radius.circular(rectangleState.borderRadius),
            ),
          ),
        )
      ],
    );
  }
}
