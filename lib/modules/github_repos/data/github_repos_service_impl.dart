import 'dart:async';

import 'package:either_dart/either.dart';

import '../interactor/github_repos_service.dart';
import '../interactor/github_repos_states.dart';
import 'github_repos_data_source.dart';

class GithubReposServiceIMPL implements GithubReposService {
  final GithubReposDataSource githubReposDatasource;

  GithubReposServiceIMPL({required this.githubReposDatasource});

  @override
  FutureOr<GithubReposState> getGithubRepos() async {
    final result = await githubReposDatasource.getGithubRepos();
    switch (result) {
      case Left _:
        return GithubReposState.setError('Erro na requisição');
      case Right(value: final repositories):
        return GithubReposState.setRepos(repositories);
    }
  }
}
