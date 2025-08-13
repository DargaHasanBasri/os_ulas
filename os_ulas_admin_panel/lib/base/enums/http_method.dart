/// Supported HTTP methods.
enum HttpMethod {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE;

  /// Returns the enum case name as a string.
  String get method => name;
}
