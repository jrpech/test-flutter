class AppException implements Exception {
  String message;

  AppException(this.message);

  String errorMessage() {
    return this.message;
  }
}

class ServerError implements Exception {
  final String body;
  final int code;
  static const String _UNKNOWN_SERVER_ERROR = "Error inesperado del servidor";

  String errorMessage() {
    return _UNKNOWN_SERVER_ERROR;
  }

  ServerError(this.body, this.code);
}

class ForbiddenError implements Exception {
  String errorMessage() {
    return "Error, tu session a expirado o es invalida";
  }

  ForbiddenError();
}
