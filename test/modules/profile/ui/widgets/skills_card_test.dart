import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/profile/model/skill.dart';
import 'package:masterclass_final_app/modules/profile/ui/widgets/skills_card.dart';

import '../../../../masterclass_app_mock.dart';

void main() {
  group('SkillsCard Widget Test |', () {
    late List<Skill> skills;

    setUp(() {
      skills = [
        Skill(id: 1, name: 'flutter', skillProficiency: .8),
        Skill(id: 2, name: 'dart', skillProficiency: .8),
        Skill(id: 3, name: 'javascript', skillProficiency: .6),
        Skill(id: 4, name: 'kotlin', skillProficiency: .7),
        Skill(id: 5, name: 'ruby', skillProficiency: .3),
        Skill(id: 6, name: 'c++', skillProficiency: .5),
      ];
    });

    testWidgets('should display the all skills names', (tester) async {
      final view = SkillsCard(skills: skills);

      await tester.pumpWidget(FlutterandoAppMock(view: view));
      for (final skill in skills) {
        expect(find.text(skill.name), findsAtLeastNWidgets(1));
      }
    });
  });
}
