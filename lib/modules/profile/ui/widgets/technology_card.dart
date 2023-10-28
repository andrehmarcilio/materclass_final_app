import 'package:flutter/material.dart';

import '../../../../commons/widgets/svg_widget.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../model/technology.dart';

class TechnologyCard extends StatelessWidget {
  final Technology technology;

  const TechnologyCard({required this.technology, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgWidget(
            key: ValueKey(technology.toString()),
            width: 48,
            height: 48,
            svgAsset: technology.icon,
          ),
          const SizedBox(height: 12),
          Flexible(
            child: FittedBox(
              child: Text(
                technology.name,
                style: context.fonts.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
