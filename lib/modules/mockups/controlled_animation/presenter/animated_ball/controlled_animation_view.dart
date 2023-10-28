import 'package:flutter/material.dart';

class ControlledAnimationView extends StatefulWidget {
  const ControlledAnimationView({super.key});

  @override
  State<ControlledAnimationView> createState() => _ControlledAnimationViewState();
}

class _ControlledAnimationViewState extends State<ControlledAnimationView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> animatedWidth;
  late Animation<Color?> animatedColor;
  late Animation<double> animatedBorder;
  late Animation<Alignment> animatedAlignment;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    animatedWidth = Tween<double>(begin: 50, end: 100).animate(_animationController);
    animatedBorder = Tween<double>(begin: 50, end: 15).animate(_animationController);
    animatedColor = ColorTween(begin: Colors.red, end: Colors.yellow).animate(_animationController);
    animatedAlignment = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topCenter),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.topCenter, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
        weight: 1,
      ),
    ]).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return Align(
            alignment: animatedAlignment.value,
            child: GestureDetector(
              onTap: () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                  return;
                }
                _animationController.forward();
              },
              child: Container(
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: animatedColor.value,
                  borderRadius: BorderRadius.circular(animatedBorder.value),
                ),
                width: animatedWidth.value,
                height: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
