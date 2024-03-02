class AppExceptions implements Exception {
  final String message;
  const AppExceptions({required this.message});
}

class ServerRequestTimeOutException extends AppExceptions {
  ServerRequestTimeOutException({String? message})
      : super(
          message: message ?? "Server request timeout",
        );
}

class BadRequestException extends AppExceptions {
  BadRequestException({String? message})
      : super(
          message: message ?? "Bad request",
        );
}

class NoInternetException extends AppExceptions {
  NoInternetException({String? message})
      : super(
          message: message ?? "No internet connection",
        );
}

class InternalServerException extends AppExceptions {
  InternalServerException({String? message})
      : super(
          message: message ?? "Internal server error",
        );
}

class ResourceNotFoundException extends AppExceptions {
  ResourceNotFoundException({String? message})
      : super(
          message: message ?? "Internal server error",
        );
}
