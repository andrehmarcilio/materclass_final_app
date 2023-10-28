import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/profile/data/profile_data.dart';
import 'package:masterclass_final_app/modules/profile/ui/profile_page.dart';
import 'package:masterclass_final_app/modules/profile/ui/widgets/profile_info_card.dart';
import 'package:masterclass_final_app/modules/profile/ui/widgets/skills_card.dart';
import 'package:masterclass_final_app/modules/profile/ui/widgets/technology_card.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../masterclass_app_mock.dart';

void main() {
  group('ProfilePage Widget Tests |', () {
    testWidgets('should display a profile_info_card widget', (tester) async {
      const view = ProfilePage();

      await mockNetworkImages(() => tester.pumpWidget(const FlutterandoAppMock(view: view)));

      expect(find.byType(ProfileInfoCard), findsOneWidget);
    });

    testWidgets('should display favorite technology cards', (tester) async {
      final favoriteTechnologies = profileData.favoriteTecnologies;

      const view = ProfilePage();

      await mockNetworkImages(() => tester.pumpWidget(const FlutterandoAppMock(view: view)));
      final verticalScrollable = find.byWidgetPredicate((widget) {
        return widget is Scrollable && widget.axis == Axis.vertical;
      });

      await tester.scrollUntilVisible(
        find.byType(TechnologyCard).first,
        50,
        scrollable: verticalScrollable,
      );

      final horizontalScrollable = find.byWidgetPredicate((widget) {
        return widget is Scrollable && widget.axis == Axis.horizontal;
      });

      for (final technology in favoriteTechnologies) {
        await tester.scrollUntilVisible(
          find.byKey(ValueKey(favoriteTechnologies.first.toString())),
          50,
          scrollable: horizontalScrollable,
        );
        expect(find.byKey(ValueKey(technology.toString())), findsOneWidget);
      }
    });

    testWidgets('should display profile skills card', (tester) async {
      const view = ProfilePage();

      await mockNetworkImages(() => tester.pumpWidget(const FlutterandoAppMock(view: view)));
      final verticalScrollable = find.byWidgetPredicate((widget) {
        return widget is Scrollable && widget.axis == Axis.vertical;
      });

      await tester.scrollUntilVisible(
        find.byType(SkillsCard).first,
        50,
        scrollable: verticalScrollable,
      );

      expect(find.byType(SkillsCard), findsOneWidget);
    });
  });
}
