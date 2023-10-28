import 'package:flutter/material.dart';

import '../../../app/router/root_router_delegate.dart';
import '../../../commons/widgets/my_app_bar.dart';
import '../../../commons/widgets/sliver_gap.dart';
import '../../../utils/service_locator/service_locator.dart';
import '../../../utils/services/url_launcher.dart';
import '../../activities/model/activity.dart';
import '../../activities/router/activities_router_delegate.dart';
import '../model/exercice.dart';
import 'widgets/exercice_card.dart';

class ExercicesPage extends StatelessWidget {
  final Activity activity;

  const ExercicesPage({required this.activity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: activity.title,
        onBackPressed: ActivitiesRouterDelegate.fromNavigatorKey.unselectActivity,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverGap(size: 16),
          SliverSafeArea(
            sliver: SliverList.separated(
              itemCount: activity.exercices.length,
              itemBuilder: (_, index) {
                final exercice = activity.exercices[index];

                return ExerciceCard(
                  number: index + 1,
                  exercice: exercice,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  onTap: () => _onTapExercice(exercice),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapExercice(Exercice exercice) {
    switch (exercice) {
      case FlutterExercice():
        RootRouterDelegate.fromNavigatorKey.selectExercice(exercice);
      case DartExercice():
        serviceLocator.get<UrlLauncher>().launchUrl(exercice.githubUrl);
    }
  }
}
