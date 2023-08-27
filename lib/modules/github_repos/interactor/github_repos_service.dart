import 'dart:async';

import 'github_repos_states.dart';

abstract interface class GithubReposService {
  FutureOr<GithubReposState> getGithubRepos();
}
