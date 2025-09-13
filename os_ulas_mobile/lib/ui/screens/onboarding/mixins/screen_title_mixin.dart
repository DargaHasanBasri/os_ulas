import 'package:gen/generated/locale_keys.g.dart';
import 'package:os_ulas_mobile/utils/extensions/string_localizations.dart';

/// ScreenTitleMixin sets screen titles and button texts
/// for the onboarding page in the application.
mixin ScreenTitleMixin {
  /// OnboardingManinScreen button title 'Start'.
  String get onboardingMainScreenStartBtnTitle =>
      LocaleKeys.general_start.locale;

  /// OnboardingManinScreen button title 'Next'.
  String get onboardingMainScreenNextBtnTitle => LocaleKeys.general_next.locale;

  /// OnboardingManinScreen button title 'Skip'.
  String get onboardingMainScreenSkipBtnTitle => LocaleKeys.general_skip.locale;

  /// OnboardingFirstScreen main title.
  String get onboardingFirstScreenTitle =>
      LocaleKeys.onboardingScreen_firstScreenTitle.locale;

  /// OnboardingFirstScreen subTitle.
  String get onboardingFirstScreenSubTitle =>
      LocaleKeys.onboardingScreen_firstScreenSubTitle.locale;

  /// OnboardingSecondScreen main title.
  String get onboardingSecondScreenTitle =>
      LocaleKeys.onboardingScreen_secondScreenTitle.locale;

  /// OnboardingSecondScreen subTitle.
  String get onboardingSecondScreenSubTitle =>
      LocaleKeys.onboardingScreen_secondScreenSubTitle.locale;

  /// OnboardingThirdScreen main title.
  String get onboardingThirdScreenTitle =>
      "${LocaleKeys.onboardingScreen_thirdScreenTitleOne.locale}"
      "\n${LocaleKeys.onboardingScreen_thirdScreenTitleTwo.locale}";

  /// OnboardingThirdScreen subTitle.
  String get onboardingThirdScreenSubTitle =>
      LocaleKeys.onboardingScreen_thirdScreenSubTitle.locale;
}
