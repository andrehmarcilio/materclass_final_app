import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_extensions.dart';
import '../../model/skill.dart';
import 'skill_chart_item.dart';

class SkillsCard extends StatelessWidget {
  final List<Skill> skills;
  final EdgeInsets? margin;

  const SkillsCard({required this.skills, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: skills.map(SkillChartItem.new).toList(),
      ),
    );
  }
}
