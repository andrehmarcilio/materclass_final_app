import 'package:flutter/material.dart';

import '../../../commons/widgets/my_app_bar.dart';
import '../../../commons/widgets/sliver_gap.dart';
import '../data/activities_data.dart' as activities_data;
import 'widgets/activity_card.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Atividades',
      ),
      body: CustomScrollView(
        slivers: [
          const SliverGap(size: 16),
          SliverSafeArea(
            sliver: SliverList.separated(
              itemCount: activities_data.activies.length,
              itemBuilder: (_, index) {
                final activity = activities_data.activies[index];

                return ActivityCard(
                  title: activity.title,
                  iconPath: activity.iconPath,
                  description: activity.description,
                  exercicesCount: activity.exercicesCount,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  onTapSeeMore: () {},
                  onTapAccessCode: () {},
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
