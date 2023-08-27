import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/widgets/circular_loading.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_atoms.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_states.dart';
import 'package:masterclass_final_app/modules/github_repos/model/github_repo.dart';
import 'package:masterclass_final_app/modules/github_repos/ui/github_repos_page.dart';
import 'package:masterclass_final_app/utils/services/url_launcher.dart';
import 'package:mocktail/mocktail.dart';

import '../../../masterclass_app_mock.dart';

class UrlLauncherMock extends Mock implements UrlLauncher {}

void main() {
  group('GithubReposPage Widget Tests |', () {
    testWidgets('should display app bar with correct title', (tester) async {
      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: GithubReposPage()));

      // Assert
      expect(find.text('Repositórios'), findsOneWidget);
    });

    testWidgets('should display repo cards with correct data when githubReposState is success', (tester) async {
      // Arrange
      final repos = <GithubRepo>[
        GithubRepo(id: 1, size: 300, title: 'repo 1', description: 'description 1'),
        GithubRepo(id: 2, size: 300, title: 'repo 2', description: 'description 2'),
        GithubRepo(id: 3, size: 300, title: 'repo 3', description: 'description 3'),
        GithubRepo(id: 4, size: 300, title: 'repo 4', description: 'description 4'),
      ];
      githubReposState.value = GithubReposSuccesssLoaded(repositories: repos);
      await tester.pumpAndSettle();

      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: GithubReposPage()));

      // Assert
      for (final repos in repos) {
        await tester.scrollUntilVisible(find.text(repos.title), 50);
        expect(find.text(repos.title, skipOffstage: false), findsAtLeastNWidgets(1));
        expect(find.text(repos.description, skipOffstage: false), findsAtLeastNWidgets(1));
      }
    });

    testWidgets('should display circular loading when githubReposState is loading', (tester) async {
      // Arrange
      githubReposState.value = const GithubReposLoading();
      await tester.pumpAndSettle();

      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: GithubReposPage()));

      // Assert
      expect(find.byType(CircularLoading), findsOneWidget);
    });

    testWidgets('should display error message when githubReposState is error', (tester) async {
      // Arrange
      const errorMessage = 'ERROR MESSAGE';
      githubReposState.value = const GithubReposError(errorMessage: errorMessage);
      await tester.pumpAndSettle();

      // Act
      await tester.pumpWidget(const FlutterandoAppMock(view: GithubReposPage()));

      // Assert
      expect(find.text(errorMessage), findsOneWidget);
    });
  });
}
