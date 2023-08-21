import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/assets.dart' as assets;
import '../../../../utils/extensions/context_extensions.dart';
import '../../model/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final EdgeInsets? margin;
  final VoidCallback onTapSeeMore;
  final VoidCallback onTapAccessCode;

  const ActivityCard({
    required this.activity,
    required this.onTapSeeMore,
    required this.onTapAccessCode,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Container(
      margin: margin,
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  activity.iconPath,
                  colorFilter: ColorFilter.mode(colors.surface, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 12),
              Text(activity.title, style: fonts.titleMedium),
              const Spacer(),
              Text('Exercicios: ${activity.exercicesCount}', style: fonts.bodySmall),
            ],
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  activity.description,
                  style: fonts.bodySmall,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    TextButton.icon(
                      key: ValueKey('activity_text_btn_${activity.id}'),
                      style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      icon: SvgPicture.asset(
                        assets.icGithub,
                        colorFilter: ColorFilter.mode(colors.onSurface, BlendMode.srcIn),
                      ),
                      label: Text(
                        'Acessar código fonte',
                        style: fonts.bodySmall,
                      ),
                      onPressed: onTapAccessCode,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: onTapSeeMore,
                      child: const Text('Ver mais'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
