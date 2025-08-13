import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

/// The AppEnvironment class is used to select the appropriate configuration
/// based on the environment (development or production)
/// in which the application is running.
final class AppEnvironment {
  /// The `current` getter returns the application's current environment.
  /// If the application is running in debug mode (`kDebugMode` is true),
  /// the development environment (`DevEnv`) is selected. Otherwise,
  /// the production environment (`ProdEnv`) is selected.
  static AppEnv get current {
    if (kDebugMode) {
      return DevEnv();
    } else {
      return ProdEnv();
    }
  }
}
