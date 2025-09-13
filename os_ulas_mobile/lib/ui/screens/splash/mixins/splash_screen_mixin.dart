import 'package:gen/generated/locale_keys.g.dart';
import 'package:os_ulas_mobile/utils/extensions/string_localizations.dart';

mixin SplashScreenMixin {
  /// SplashScreen main title and subtitle.
  String get splashTitleAndSubtitle =>
      "${LocaleKeys.splashScreen_title.locale}\n${LocaleKeys.splashScreen_subTitle.locale}";
}
