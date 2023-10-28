import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/widgets/my_app_bar.dart';
import 'package:masterclass_final_app/modules/activities/model/activity.dart';
import 'package:masterclass_final_app/modules/exercices/model/exercice.dart';
import 'package:masterclass_final_app/modules/exercices/ui/exercices_page.dart';
import 'package:masterclass_final_app/utils/assets.dart';
import 'package:masterclass_final_app/utils/service_locator/service_locator.dart';
import 'package:masterclass_final_app/utils/services/url_launcher.dart';
import 'package:mocktail/mocktail.dart';

import '../../../masterclass_app_mock.dart';

class UrlLauncherMock extends Mock implements UrlLauncher {}

void main() {
  group('ExercicesPage Widget Tests |', () {
    testWidgets('should display app bar with activity title', (tester) async {
      // Arrange
      const activityTitle = 'activity title';
      final activity = Activity(
        id: 1,
        title: activityTitle,
        iconPath: icRunning,
        description: 'card description',
        exercices: [],
        repoUrl: 'repoUrl',
      );

      // Act
      await tester.pumpWidget(FlutterandoAppMock(view: ExercicesPage(activity: activity)));

      // Assert
      expect(
        find.byWidgetPredicate((widget) => widget is MyAppBar && widget.title == activityTitle),
        findsOneWidget,
      );
    });

    testWidgets('should display exercices cards with correct data', (tester) async {
      // Arrange
      final exercices = <Exercice>[
        FlutterExercice(id: 1, title: 'exercice 1', routePath: '/exercice_1'),
        FlutterExercice(id: 2, title: 'exercice 2', routePath: '/exercice_2'),
        FlutterExercice(id: 3, title: 'exercice 3', routePath: '/exercice_3'),
        FlutterExercice(id: 4, title: 'exercice 4', routePath: '/exercice_4'),
      ];
      final activity = Activity(
        id: 1,
        title: 'activity title',
        iconPath: icRunning,
        description: 'card description',
        exercices: exercices,
        repoUrl: 'repoUrl',
      );

      // Act
      await tester.pumpWidget(FlutterandoAppMock(view: ExercicesPage(activity: activity)));

      // Assert
      for (final exercice in exercices) {
        await tester.scrollUntilVisible(find.text(exercice.title), 50);
        expect(find.text(exercice.title, skipOffstage: false), findsOneWidget);
      }
    });

    testWidgets('should launch the githubUrl when a DartExercice is pressed', (tester) async {
      // Arrange
      final dartExercice = DartExercice(
        id: 1,
        title: 'exercice 1',
        githubUrl: 'https://github.com/exercice_1',
      );
      final exercices = <Exercice>[
        dartExercice,
        FlutterExercice(id: 2, title: 'exercice 2', routePath: '/exercice_2'),
        FlutterExercice(id: 3, title: 'exercice 3', routePath: '/exercice_3'),
        FlutterExercice(id: 4, title: 'exercice 4', routePath: '/exercice_4'),
      ];
      final launcher = UrlLauncherMock();
      serviceLocator.registerSingleton<UrlLauncher>(launcher);

      final activity = Activity(
        id: 1,
        title: 'activity title',
        iconPath: icRunning,
        description: 'card description',
        exercices: exercices,
        repoUrl: 'repoUrl',
      );
      await tester.pumpWidget(FlutterandoAppMock(view: ExercicesPage(activity: activity)));
      await tester.scrollUntilVisible(find.text(dartExercice.title), 50);

      // Act
      await tester.tap(find.text(dartExercice.title, skipOffstage: false));

      // Assert
      verify(() => launcher.launchUrl(dartExercice.githubUrl)).called(1);

      await serviceLocator.reset();
    });
  });
}
