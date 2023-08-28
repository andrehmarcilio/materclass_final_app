import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_atoms.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_events.dart';
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
        url: 'my_repo_url',
        size: 12,
      );
      final view = GithubRepoCard(githubRepo: repository);

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(repository.title), findsOneWidget);
    });

    testWidgets('should display the repository description', (tester) async {
      final repository = GithubRepo(
        id: 1,
        url: 'my_repo_url',
        title: 'My Repo Title',
        description: 'repo description',
        size: 12,
      );
      final view = GithubRepoCard(githubRepo: repository);

      await tester.pumpWidget(FlutterandoAppMock(view: view));

      expect(find.text(repository.description), findsOneWidget);
    });

    testWidgets('should add SeeSourceCode event when tapped', (tester) async {
      // Arrange
      late GithubReposEvents event;
      void listenInvokedEvents() {
        event = githubReposEvents.value!;
      }

      githubReposEvents.addListener(listenInvokedEvents);

      final repository = GithubRepo(
        id: 1,
        url: 'my_repo_url',
        title: 'My Repo Title',
        description: 'repo description',
        size: 12,
      );
      final view = GithubRepoCard(githubRepo: repository);
      await tester.pumpWidget(FlutterandoAppMock(view: view));

      // Act
      await tester.tap(find.byType(GithubRepoCard));

      expect(event, isA<SeeSourceCode>());

      githubReposEvents.removeListener(listenInvokedEvents);
    });
  });
}
