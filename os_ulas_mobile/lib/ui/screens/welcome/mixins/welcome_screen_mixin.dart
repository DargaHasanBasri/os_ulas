import 'package:gen/generated/locale_keys.g.dart';
import 'package:os_ulas_mobile/utils/extensions/string_localizations.dart';

mixin WelcomeScreenMixin {
  /// WelcomeScreen main title.
  String get welcomeScreenTitle => LocaleKeys.welcomeScreen_title.locale;
  String get welcomeScreenSingWith => LocaleKeys.welcomeScreen_signWith.locale;
  String get welcomeScreenGuestUser => LocaleKeys.buttonTitle_guestUser.locale;
  String get welcomeScreenIsAccount => LocaleKeys.welcomeScreen_isAccount.locale;
  String get welcomeScreenSingUp => LocaleKeys.welcomeScreen_signUp.locale;
}
