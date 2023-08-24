import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/widgets/my_app_bar.dart';
import 'package:masterclass_final_app/modules/activities/model/activity.dart';
import 'package:masterclass_final_app/modules/exercices/model/exercice.dart';
import 'package:masterclass_final_app/modules/exercices/ui/exercices_page.dart';
import 'package:masterclass_final_app/utils/assets.dart';

import '../../../masterclass_app_mock.dart';

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
        Exercice(id: 1, title: 'exercice 1', routePath: '/exercice_1'),
        Exercice(id: 2, title: 'exercice 2', routePath: '/exercice_2'),
        Exercice(id: 3, title: 'exercice 3', routePath: '/exercice_3'),
        Exercice(id: 4, title: 'exercice 4', routePath: '/exercice_4'),
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
  });
}
