import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/activities/ui/widgets/activity_card.dart';
import 'package:masterclass_final_app/utils/assets.dart';

import '../../../../masterclass_app_mock.dart';

void main() {
  group('ActivityCard Widget Tests |', () {
    testWidgets('should display the activity title when instantiated', (tester) async {
      // Arrange
      const activityTitle = 'activity title';
      final activityCard = ActivityCard(
        title: activityTitle,
        iconPath: icRunning,
        description: 'card description',
        exercicesCount: 3,
        onTapSeeMore: () {},
        onTapAccessCode: () {},
      );

      // Act
      await tester.pumpWidget(FlutterandoAppMock(view: activityCard));

      // Assert
      expect(find.text(activityTitle), findsOneWidget);
    });

    testWidgets('should display the activity description when instantiated', (tester) async {
      // Arrange
      const activityDescription = 'activity description';
      final activityCard = ActivityCard(
        title: 'activity title',
        iconPath: icRunning,
        description: activityDescription,
        exercicesCount: 3,
        onTapSeeMore: () {},
        onTapAccessCode: () {},
      );

      // Act
      await tester.pumpWidget(FlutterandoAppMock(view: activityCard));

      // Assert
      expect(find.text(activityDescription), findsOneWidget);
    });

    testWidgets('should invoke onTapSeeMore when tapped see more button', (tester) async {
      // Arrange
      var timesInvokedSeeMore = 0;
      void onTapSeeMore() {
        timesInvokedSeeMore++;
      }

      final activityCard = ActivityCard(
        title: 'activity title',
        iconPath: icRunning,
        description: 'activity description',
        exercicesCount: 3,
        onTapSeeMore: onTapSeeMore,
        onTapAccessCode: () {},
      );
      await tester.pumpWidget(FlutterandoAppMock(view: activityCard));
      final seeMoreButton = find.byType(ElevatedButton);

      // Act
      await tester.tap(seeMoreButton);

      // Assert
      expect(timesInvokedSeeMore, 1);
    });

    testWidgets('should invoke onTapAccessCode when tapped access code button', (tester) async {
      // Arrange
      var timesInvokedAccessCode = 0;
      void onTapAccessCode() {
        timesInvokedAccessCode++;
      }

      final activityCard = ActivityCard(
        title: 'activity title',
        iconPath: icRunning,
        description: 'activity description',
        exercicesCount: 3,
        onTapSeeMore: () {},
        onTapAccessCode: onTapAccessCode,
      );
      await tester.pumpWidget(FlutterandoAppMock(view: activityCard));
      final accessCodeButton = find.byWidgetPredicate((widget) => widget is TextButton);

      // Act
      await tester.tap(accessCodeButton);

      // Assert
      expect(timesInvokedAccessCode, 1);
    });
  });
}
