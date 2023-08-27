import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_atoms.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_events.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_reducer.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_service.dart';
import 'package:masterclass_final_app/modules/github_repos/interactor/github_repos_states.dart';
import 'package:mocktail/mocktail.dart';

class GithubServiceMock extends Mock implements GithubReposService {}

void main() {
  late GithubServiceMock githubServiceMock;
  late GithubReposReducer sut;
  group('GithubReposReducer Unit Tests |', () {
    setUp(() {
      githubServiceMock = GithubServiceMock();
      githubReposState.value = GithubReposState.initial();
      sut = GithubReposReducer(repositoriesService: githubServiceMock);
    });

    tearDown(() {
      sut.dispose();
    });

    test('should emits loading and success State when getGithubRepos returns a succes', () async {
      // Arrange
      final states = <GithubReposState>[];
      final expectStatesTypes = <Type>[GithubReposLoading, GithubReposSuccesssLoaded];
      githubReposState.addListener(() {
        states.add(githubReposState.value);
      });
      when(() => githubServiceMock.getGithubRepos()).thenReturn(GithubReposState.setRepos([]));

      // Act
      githubReposEvents.add(GetGithubRepos());

      // Assert
      for (var i = 0; i < 2; i++) {
        await expectLater(states[i].runtimeType, expectStatesTypes[i]);
      }
    });

    test('should emits loading and error State when getGithubRepos returns a failure', () async {
      // Arrange
      final states = <GithubReposState>[];
      final expectStatesTypes = <Type>[GithubReposLoading, GithubReposError];
      githubReposState.addListener(() {
        states.add(githubReposState.value);
      });
      when(() => githubServiceMock.getGithubRepos()).thenReturn(GithubReposState.setError('Error message'));

      // Act
      githubReposEvents.add(GetGithubRepos());

      // Assert
      for (var i = 0; i < 2; i++) {
        await expectLater(states[i].runtimeType, expectStatesTypes[i]);
      }
    });
  });
}
