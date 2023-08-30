import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/models/svg_asset.dart';
import 'package:masterclass_final_app/modules/profile/model/technology.dart';
import 'package:masterclass_final_app/modules/profile/ui/widgets/technology_card.dart';

import '../../../../masterclass_app_mock.dart';

void main() {
  group('TechnologyCard Widget Test |', () {
    late Technology technology;

    setUp(() {
      technology = Technology(id: 1, name: 'Flutter', icon: SvgAsset.icGithub);
    });

    testWidgets('should display the technology name', (tester) async {
      final view = TechnologyCard(technology: technology);

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(technology.name), findsOneWidget);
    });

    testWidgets('should display the technology icon', (tester) async {
      final view = TechnologyCard(technology: technology);

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.byKey(ValueKey(technology.toString())), findsOneWidget);
    });
  });
}
