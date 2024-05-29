class RequestException implements Exception {
  final String message;

  RequestException(this.message);

  @override
  String toString() => 'RequestException: $message';
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}