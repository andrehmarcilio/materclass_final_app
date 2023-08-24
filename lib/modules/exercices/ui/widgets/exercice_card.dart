import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_extensions.dart';
import '../../model/exercice.dart';

class ExerciceCard extends StatelessWidget {
  final int index;
  final Exercice exercice;
  final EdgeInsets? margin;

  const ExerciceCard({
    required this.index,
    required this.exercice,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Container(
      height: 64,
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
            ),
            child: Text(
              index.toString(),
              style: fonts.bodyLarge?.copyWith(color: colors.onPrimary),
            ),
          ),
          const Spacer(),
          Text(exercice.title, style: fonts.titleMedium)
        ],
      ),
    );
  }
}
