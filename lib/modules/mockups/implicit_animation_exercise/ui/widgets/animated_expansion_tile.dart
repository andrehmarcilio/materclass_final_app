import 'package:flutter/material.dart';

class AnimatedExpansionTile extends StatefulWidget {
  const AnimatedExpansionTile({super.key});

  @override
  State<AnimatedExpansionTile> createState() => _AnimatedExpansionTileState();
}

class _AnimatedExpansionTileState extends State<AnimatedExpansionTile> {
  bool selected = false;
  double currentAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            selected = !selected;
            if (selected) {
              currentAngle = 0.5;
            } else {
              currentAngle = 0;
            }
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('AnimatedExpansionTile'),
                AnimatedRotation(
                  turns: currentAngle,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: AnimatedAlign(
            curve: Curves.easeInOut,
            alignment: Alignment.center,
            heightFactor: currentAngle * 2,
            duration: const Duration(milliseconds: 400),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('Content here'),
            ),
          ),
        ),
      ],
    );
  }
}
