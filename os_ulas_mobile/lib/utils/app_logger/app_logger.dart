import 'package:logger/logger.dart';

final class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 0,
      methodCount: 0,
      errorMethodCount: 0,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  /// Logs detailed debug messages
  static void debugMsj(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Logs information messages
  static void infoMsj(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Logs warning messages
  static void warningMsj(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Error messages
  static void errorMsj(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Logs critical, very serious errors
  static void fatalErrorMsj(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
