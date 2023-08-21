import 'package:flutter/material.dart';

import '../../../commons/widgets/my_app_bar.dart';
import '../../../commons/widgets/sliver_gap.dart';
import '../../../utils/service_locator/service_locator.dart';
import '../../../utils/services/url_launcher.dart';
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
                  activity: activity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  onTapSeeMore: () {},
                  onTapAccessCode: () {
                    final launcher = serviceLocator.get<UrlLauncher>();
                    launcher.launchUrl(activity.repoUrl);
                  },
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
