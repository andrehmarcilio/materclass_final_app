sealed class GithubReposEvents {}

class GetGithubRepos extends GithubReposEvents {}

class SeeSourceCode extends GithubReposEvents {
  final String sourceCodeUrl;

  SeeSourceCode({required this.sourceCodeUrl});
}
