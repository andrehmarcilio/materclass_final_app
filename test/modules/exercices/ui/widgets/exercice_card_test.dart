import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/exercices/model/exercice.dart';
import 'package:masterclass_final_app/modules/exercices/ui/widgets/exercice_card.dart';

import '../../../../masterclass_app_mock.dart';

void main() {
  group('ExerciceCard Widget Tests |', () {
    testWidgets('should display the exercice title', (tester) async {
      final exercice = FlutterExercice(id: 1, title: 'Animation', routePath: '/animation');
      final view = ExerciceCard(
        exercice: exercice,
        number: 1,
        onTap: () {},
      );

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(exercice.title), findsOneWidget);
    });

    testWidgets('should display the exercice index', (tester) async {
      const index = 1;
      final exercice = FlutterExercice(id: 1, title: 'Animation', routePath: '/animation');
      final view = ExerciceCard(
        exercice: exercice,
        number: index,
        onTap: () {},
      );

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(index.toString()), findsOneWidget);
    });
  });
}
