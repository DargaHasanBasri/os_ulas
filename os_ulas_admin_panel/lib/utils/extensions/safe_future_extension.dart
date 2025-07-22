import '../../export.dart';

/// Defines an extension for [Future] objects.
/// It allows you to manage success and error conditions centrally.
extension FutureHandlerExtension<T> on Future<T> {
  Future<void> handle({
    void Function(T result)? onSuccess,
    void Function(Object e, StackTrace stack)? onError,
  }) async {
    try {
      /// If the Future completes successfully, get the result.
      final result = await this;

      /// If an onSuccess function is provided, send the result to it.
      onSuccess?.call(result);
    } catch (e, stack) {
      /// In case of error, if the onError function is given, send the error.
      onError?.call(e, stack);

      /// TODO: Customize it later
      /// Write the error and stack trace to the debug output.
      debugPrint("Hata: $e\n$stack");
    }
  }
}
