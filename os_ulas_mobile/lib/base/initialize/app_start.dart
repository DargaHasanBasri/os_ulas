import '../../export.dart';
import 'package:easy_localization/easy_localization.dart';

/// A static class that handles application initialization.
class AppStart {
  static Future<void> init() async {
    /// Flutter starts widget binding.
    WidgetsFlutterBinding.ensureInitialized();

    /// Initializes the EasyLocalization library.
    await EasyLocalization.ensureInitialized();

    /// Sets the system interface style.
    /// Status bar color and screen brightness are specified.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
