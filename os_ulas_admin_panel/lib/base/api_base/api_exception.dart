class ApiException implements Exception {
  /// The error message describing what went wrong.
  final String? _message;

  /// A short prefix to indicate the type of error.
  final String? _prefix;

  /// (Optional) HTTP status code or custom error code.
  final int? statusCode;

  /// Creates an [ApiException] with an optional [message], [prefix], and [statusCode].
  const ApiException([this._message, this._prefix, this.statusCode]);

  /// Returns the error message (without prefix).
  String? get message => _message;

  /// Returns the error prefix.
  String? get prefix => _prefix;

  @override
  String toString() {
    return "${_prefix ?? ''}${_message ?? ''}";
  }
}

/// Exception for communication errors (e.g., no internet, server down).
class FetchDataException extends ApiException {
  FetchDataException([String? message, int? statusCode])
    : super(message, "Error During Communication: ", statusCode);
}

/// Exception for invalid requests (e.g., bad request, malformed data).
class BadRequestException extends ApiException {
  BadRequestException([String? message, int? statusCode])
    : super(message, "Invalid Request: ", statusCode);
}

/// Exception for unauthorized access (e.g., 401 or 403 errors).
class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message, int? statusCode])
    : super(message, "Unauthorised: ", statusCode);
}

/// Exception for invalid or unexpected input data.
class InvalidInputException extends ApiException {
  InvalidInputException([String? message, int? statusCode])
    : super(message, "Invalid Input: ", statusCode);
}
