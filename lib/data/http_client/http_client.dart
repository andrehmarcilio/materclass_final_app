import 'dart:async';
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../commons/exceptions/request_exception.dart';

abstract interface class HttpClient {
  FutureOr<Either<RequestException, dynamic>> get(String url);
}

class HttpClientIMPL implements HttpClient {
  final http.Client? client;

  HttpClientIMPL([this.client]);

  @override
  FutureOr<Either<RequestException, dynamic>> get(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await client?.get(uri) ?? await http.get(uri);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(jsonDecode(response.body));
      }
      return Left(RequestException(response.body, response.statusCode));
    } finally {
      client?.close();
    }
  }
}
