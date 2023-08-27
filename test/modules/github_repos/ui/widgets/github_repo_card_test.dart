import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/github_repos/model/github_repo.dart';
import 'package:masterclass_final_app/modules/github_repos/ui/widgets/github_repo_card.dart';

import '../../../../masterclass_app_mock.dart';

void main() {
  group('RepositoryCard Widget Tests |', () {
    testWidgets('should display the repository title', (tester) async {
      final repository = GithubRepo(
        id: 1,
        title: 'My Repo Title',
        description: 'repo description',
        size: 12,
      );
      final view = RepositoryCard(githubRepo: repository);

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(repository.title, findRichText: true), findsOneWidget);
    });

    testWidgets('sshould display the repository description', (tester) async {
      final repository = GithubRepo(
        id: 1,
        title: 'My Repo Title',
        description: 'repo description',
        size: 12,
      );
      final view = RepositoryCard(githubRepo: repository);

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(repository.description), findsOneWidget);
    });
  });
}
