import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_extensions.dart';
import '../../model/skill.dart';

class SkillChartItem extends StatelessWidget {
  final Skill skill;

  const SkillChartItem(this.skill, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          SizedBox(
            width: 108,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                skill.name,
                style: context.fonts.bodyLarge,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: skill.skillProficiency,
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
