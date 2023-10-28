/// Custom exception class for handling request-related errors.
class RequestException implements Exception {
  final String message;
  final int statusCode;

  /// Creates a [RequestException] with the provided [message] and [statusCode].
  RequestException(this.message, this.statusCode);
}
