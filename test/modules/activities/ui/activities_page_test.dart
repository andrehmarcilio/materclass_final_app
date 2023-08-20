import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/activities/data/activities_data.dart' as activities_data;
import 'package:masterclass_final_app/modules/activities/ui/activities_page.dart';

import '../../../masterclass_app_mock.dart';

void main() {
  group('ActivitiesPage Widget Tests |', () {
    testWidgets('should display app bar with correct title', (tester) async {
      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: ActivitiesPage()));

      // Assert
      expect(find.text('Atividades'), findsOneWidget);
    });

    testWidgets('should display activity cards with correct data', (tester) async {
      // Arrange
      final activitiesData = activities_data.activies;

      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: ActivitiesPage()));

      // Assert
      for (final activity in activitiesData) {
        await tester.scrollUntilVisible(find.text(activity.title), 50);
        expect(find.text(activity.title, skipOffstage: false), findsOneWidget);
        expect(find.text(activity.description, skipOffstage: false), findsOneWidget);
      }
    });
  });
}
