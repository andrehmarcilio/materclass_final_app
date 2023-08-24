import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/activities/data/activities_data.dart' as activities_data;
import 'package:masterclass_final_app/modules/activities/ui/activities_page.dart';
import 'package:masterclass_final_app/modules/exercices/ui/exercices_page.dart';
import 'package:masterclass_final_app/utils/service_locator/service_locator.dart';
import 'package:masterclass_final_app/utils/services/url_launcher.dart';
import 'package:mocktail/mocktail.dart';

import '../../../masterclass_app_mock.dart';

class UrlLauncherMock extends Mock implements UrlLauncher {}

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

    testWidgets('should launche url when tap see source code btn', (tester) async {
      // Arrange
      final activitiesData = activities_data.activies;
      final launcher = UrlLauncherMock();
      serviceLocator.registerSingleton<UrlLauncher>(launcher);

      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: ActivitiesPage()));

      // Assert
      for (final activity in activitiesData) {
        await tester.scrollUntilVisible(find.byKey(ValueKey('activity_text_btn_${activity.id}')), 50);
        await tester.pumpAndSettle();
        when(() => launcher.launchUrl(activity.repoUrl)).thenReturn(true);
        await tester.tap(find.byKey(ValueKey('activity_text_btn_${activity.id}')));
        verify(() => launcher.launchUrl(activity.repoUrl)).called(1);
      }

      await serviceLocator.reset();
    });

    testWidgets('should navigate to exercices_page when tap see more btn', (tester) async {
      // Arrange
      final activitiesData = activities_data.activies;

      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: ActivitiesPage()));

      // Assert
      for (final activity in activitiesData) {
        await tester.scrollUntilVisible(find.byKey(ValueKey('activity_see_more_btn_${activity.id}')), 50);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(ValueKey('activity_see_more_btn_${activity.id}')));
        await tester.pumpAndSettle();
        expect(find.byType(ExercicesPage), findsOneWidget);
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();
      }
    });
  });
}
