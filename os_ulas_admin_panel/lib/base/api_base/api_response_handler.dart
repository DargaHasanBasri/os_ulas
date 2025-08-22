import 'package:http/http.dart' as http;
import 'export.dart';

/// A typedef representing the HTTP request.
typedef ApiRequest = Future<http.Response> Function();

/// Mixin for processing API responses
mixin ApiResponseHandler {
  /// Executes the API request, catches any errors,
  /// and processes them with handleResponse.
  /// [requestFunction] The request function is taken as a parameter.
  /// [method] GET, POST etc.
  /// [url] Requested URL.
  /// [requestBody] Request body (optional).
  Future<http.Response> handleRequest({
    required ApiRequest requestFunction,
    required String method,
    required String url,
    dynamic requestBody,
  }) async {
    int? statusCode;
    try {
      /// Run HTTP request.
      final response = await requestFunction();

      /// Get HTTP status code.
      statusCode = response.statusCode;

      /// Formats the response body.
      final formattedBody = AppUtility.formatResponseBody(response.body);

      /// Success cases.
      if (statusCode == 200 || statusCode == 201) {
        AppLogger.infoMsj(
          "✅ [$statusCode] [$method] -> $url : \n$formattedBody",
        );
        if (requestBody != null) {
          AppLogger.infoMsj(
            "📤 [$statusCode] Request Body -> $url : \n$requestBody",
          );
        }
        return response;
      }

      // Error states.
      switch (statusCode) {
        case 400:
          throw BadRequestException(response.body, statusCode);
        case 401:
        case 403:
          throw UnauthorisedException(response.body, statusCode);
        case 404:
          throw FetchDataException("Resource not found", statusCode);
        case 422:
          throw InvalidInputException(response.body, statusCode);
        case 500:
        case 502:
        case 503:
        case 504:
          throw FetchDataException("Server error:", statusCode);
        default:
          throw FetchDataException(
            "Error occurred with status code:",
            statusCode,
          );
      }
    } on SocketException {
      /// If there is no internet connection.
      AppLogger.errorMsj("🔌 [$method] -> $url : No Internet connection");
      throw FetchDataException("No Internet connection", statusCode);
    } on TimeoutException {
      /// If the request times out.
      AppLogger.errorMsj("⏱️ [$method] -> $url : Request timeout", statusCode);
      throw FetchDataException("Request timeout", statusCode);
    } on http.ClientException catch (e) {
      /// When the server cannot be connected.
      AppLogger.errorMsj(
        "🔌 [$method] -> $url : Server unavailable - ${e.message}",
        statusCode,
      );
      throw FetchDataException("Server unavailable: ${e.message}", statusCode);
    } catch (e) {
      /// When another unexpected error occurs.
      AppLogger.errorMsj(
        "❌ [$method] -> $url : Unexpected error [$statusCode] - $e",
      );
      throw FetchDataException("Unexpected error: $e", statusCode);
    }
  }
}
