import 'dart:convert';

final class AppUtility {
  AppUtility._();

  /// Helper function that makes the API response body readable.
  static String formatResponseBody(String responseBody) {
    try {
      /// Decodes JSON string.
      final decoded = jsonDecode(responseBody);

      /// If the incoming data is a list.
      if (decoded is List) {
        /// If the list is empty.
        if (decoded.isEmpty) {
          // Return empty list.
          return "[]";
        } else if (decoded.length <= 3) {
          /// If there are 3 or less elements, show all.
          return jsonEncode(decoded);
        } else {
          /// If there are more than 3 elements, show the first 3 elements
          /// and the total number of elements.
          final firstThree = decoded.take(3).toList();
          return "${jsonEncode(firstThree)} ... (${decoded.length} items total)";
        }
      } else {
        /// If not a list, return it as is.
        return responseBody;
      }
    } catch (e) {
      /// If JSON cannot be parsed, return it as is.
      return responseBody;
    }
  }
}
