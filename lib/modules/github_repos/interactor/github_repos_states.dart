import '../model/github_repo.dart';

sealed class GithubReposState {
  const GithubReposState();

  factory GithubReposState.initial() => const GithubReposInitialState();

  factory GithubReposState.setLoading() => const GithubReposLoading();

  factory GithubReposState.setRepos(List<GithubRepo> repos) {
    return GithubReposSuccesssLoaded(repositories: repos);
  }

  factory GithubReposState.setError(String errorMessage) {
    return GithubReposError(errorMessage: errorMessage);
  }
}

class GithubReposInitialState extends GithubReposState {
  const GithubReposInitialState();
}

class GithubReposLoading extends GithubReposState {
  const GithubReposLoading();
}

class GithubReposSuccesssLoaded extends GithubReposState {
  final List<GithubRepo> repositories;

  const GithubReposSuccesssLoaded({required this.repositories});
}

class GithubReposError extends GithubReposState {
  final String errorMessage;

  const GithubReposError({required this.errorMessage});
}
