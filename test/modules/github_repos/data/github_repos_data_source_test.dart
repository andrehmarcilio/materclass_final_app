import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_final_app/commons/exceptions/request_exception.dart';
import 'package:masterclass_final_app/data/http_client/http_client.dart';
import 'package:masterclass_final_app/modules/github_repos/data/github_repos_data_source.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClientMock httpClientMock;
  late GithubReposDataSource sut;
  group('GithubReposDataSource Unit Tests |', () {
    setUp(() {
      httpClientMock = HttpClientMock();
      sut = GithubReposRemoteDataSource(httpClient: httpClientMock);
    });

    test('getGithubRepos should return a success result when httpClient return a success response', () async {
      // Arrange
      when(() => httpClientMock.get(any())).thenAnswer((_) => const Right(mockedHttpSuccessAnswer));

      // Act
      final dataSourceResult = await sut.getGithubRepos();

      // Assert
      expect(dataSourceResult.isRight, true);
    });

    test('getGithubRepos should return a failure result when httpClient return a request exception', () async {
      // Arrange
      when(() => httpClientMock.get(any())).thenAnswer((_) => Left(RequestException('Message', 500)));

      // Act
      final dataSourceResult = await sut.getGithubRepos();

      // Assert
      expect(dataSourceResult.isLeft, true);
    });
  });
}

const mockedHttpSuccessAnswer = [
  {
    'id': 487009611,
    'name': 'andrehmarcilio',
    'description': 'Config files for my GitHub profile.',
    'url': 'https://api.github.com/repos/andrehmarcilio/andrehmarcilio',
    'size': 5,
  }
];
