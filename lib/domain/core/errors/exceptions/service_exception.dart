class ClientException implements Exception {
  final String? description;
  ClientException(this.description);

  @override
  String toString() {
    if (description == null) return "Exception";
    return description!;
  }
}

class ServerException implements Exception {
  final bool isTimeout;
  ServerException(this.isTimeout);

  @override
  String toString() {
    return isTimeout.toString();
  }
}

class UnknownException implements Exception {}

class RequestCancelledException implements Exception {}

class SessionException implements Exception {}
