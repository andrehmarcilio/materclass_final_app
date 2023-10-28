import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:masterclass_final_app/data/http_client/http_client.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {}

void main() {
  group('HttpClient Test |', () {
    late ClientMock mockedClient;
    late HttpClient httpClient;

    setUp(() {
      registerFallbackValue(Uri());
      mockedClient = ClientMock();
      httpClient = HttpClientIMPL(mockedClient);
    });

    test('When response status code is between 200 and 300, should return a success result', () async {
      // Arrange
      when(() => mockedClient.get(any())).thenAnswer((_) async => Response('{}', 200));

      // Act
      final result = await httpClient.get('url');

      // Assert
      expect(result.isRight, true);
    });

    test('When response status code is not between 200 and 300, should return a failure result', () async {
      // Arrange
      when(() => mockedClient.get(any())).thenAnswer((_) async => Response('{}', 404));

      // Act
      final result = await httpClient.get('url');

      // Assert
      expect(result.isLeft, true);
    });
  });
}
