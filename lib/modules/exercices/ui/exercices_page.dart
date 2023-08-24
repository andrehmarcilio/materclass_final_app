import 'package:flutter/material.dart';

import '../../../commons/widgets/my_app_bar.dart';
import '../../../commons/widgets/sliver_gap.dart';
import '../../activities/model/activity.dart';
import 'widgets/exercice_card.dart';

class ExercicesPage extends StatelessWidget {
  final Activity activity;

  const ExercicesPage({required this.activity, super.key});

  static MaterialPageRoute pageRoute({required Activity activity}) {
    return MaterialPageRoute(builder: (context) => ExercicesPage(activity: activity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: activity.title),
      body: CustomScrollView(
        slivers: [
          const SliverGap(size: 16),
          SliverSafeArea(
            sliver: SliverList.separated(
              itemCount: activity.exercices.length,
              itemBuilder: (_, index) {
                final exercice = activity.exercices[index];

                return ExerciceCard(
                  index: index + 1,
                  exercice: exercice,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }
}
