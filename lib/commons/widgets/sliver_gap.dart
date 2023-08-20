import 'package:flutter/material.dart';

class SliverGap extends StatelessWidget {
  final double size;

  const SliverGap({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox.square(dimension: size),
    );
  }
}
