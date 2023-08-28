import 'dart:async';

import 'package:either_dart/either.dart';

import '../../../commons/exceptions/request_exception.dart';
import '../../../data/http_client/http_client.dart';
import '../adapters/github_repos_adapter.dart';
import '../model/github_repo.dart';

abstract interface class GithubReposDataSource {
  FutureOr<Either<RequestException, List<GithubRepo>>> getGithubRepos();
}

class GithubReposRemoteDataSource implements GithubReposDataSource {
  final HttpClient httpClient;

  GithubReposRemoteDataSource({required this.httpClient});

  @override
  FutureOr<Either<RequestException, List<GithubRepo>>> getGithubRepos() async {
    final requestResult = await httpClient.get('https://api.github.com/users/andrehmarcilio/repos');
    return requestResult.fold(
      Left.new,
      (repositoryMaps) {
        return Right(GithubRepoAdapter.fromMapList(repositoryMaps));
      },
    );
  }
}
