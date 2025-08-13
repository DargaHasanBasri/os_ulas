import 'package:http/http.dart' as http;
import 'package:os_ulas_admin_panel/base/enums/http_method.dart';
import 'export.dart';

/// The base HTTP request class for communicating with the API.
/// It manages methods such as GET, POST, PUT, DELETE, PATCH from a single place.
/// Error and response management is done with the `ApiResponseHandler` mixin.
class ApiBase with ApiResponseHandler {
  ApiBase();

  /// Base URL based on the application's current environment.
  String get _baseUrl => AppEnvironment.current.baseUrl;

  /// Returns header information to be used in API requests.
  /// If isMultipart is true, the Content-Type is "multipart/form-data".
  /// Token and locale information is added here.
  Future<Map<String, String>> getHeader({bool isMultipart = false}) async {
    /// TODO: fix when hive is added
    final token = "";

    /// User's current language/country information.
    final locale = Intl.getCurrentLocale();

    return {
      "Content-Type": isMultipart ? "multipart/form-data" : "application/json",
      "Authorization": "Bearer $token",
      "locale": locale,
    };
  }

  /// Sends GET request.
  Future<http.Response> get(String url) async {
    final header = await getHeader();

    return handleRequest(
      requestFunction: () =>
          http.get(Uri.parse(_baseUrl + url), headers: header),
      method: HttpMethod.GET.method,
      url: url,
    );
  }

  /// Sends POST request.
  Future<http.Response> post(String url, dynamic body) async {
    final header = await getHeader();

    return handleRequest(
      requestFunction: () => http.post(
        Uri.parse(_baseUrl + url),
        headers: header,
        body: jsonEncode(body),
      ),
      method: HttpMethod.POST.method,
      url: url,
      requestBody: body,
    );
  }

  /// Sends PUT request.
  Future<http.Response> put(String url, dynamic body) async {
    final header = await getHeader();

    return handleRequest(
      requestFunction: () => http.put(
        Uri.parse(_baseUrl + url),
        headers: header,
        body: jsonEncode(body),
      ),
      method: HttpMethod.PUT.method,
      url: url,
      requestBody: body,
    );
  }

  /// Sends a PATCH request.
  Future<http.Response> patch(String url, dynamic body) async {
    final header = await getHeader();

    return handleRequest(
      requestFunction: () => http.patch(
        Uri.parse(_baseUrl + url),
        headers: header,
        body: jsonEncode(body),
      ),
      method: HttpMethod.PATCH.method,
      url: url,
      requestBody: body,
    );
  }

  /// Sends a DELETE request.
  Future<http.Response> delete(String url) async {
    final header = await getHeader();

    return handleRequest(
      requestFunction: () =>
          http.delete(Uri.parse(_baseUrl + url), headers: header),
      method: HttpMethod.DELETE.method,
      url: url,
    );
  }
}
