import '../../export.dart';

final class CustomLightTheme implements CustomTheme {
  late final ThemeData _themeData = ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.lightColorScheme,
    scaffoldBackgroundColor: CustomColorScheme.lightColorScheme.primary,
    fontFamily: 'PlusJakartaSans',
    appBarTheme: appBarTheme,
    textTheme: textTheme,
  );

  @override
  ThemeData get themeData => _themeData;

  @override
  final AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: Colors.white,
    toolbarHeight: 80,
    scrolledUnderElevation: 0,
    centerTitle: true,
  );

  @override
  final TextTheme textTheme = const TextTheme(
    /// Body light
    bodyLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: ColorName.darkJungle,
    ),
    bodyMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: ColorName.darkJungle,
    ),
    bodySmall: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: ColorName.darkJungle,
    ),

    /// Display light
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: ColorName.darkJungle,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: ColorName.darkJungle,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: ColorName.darkJungle,
    ),

    /// Headline light
    headlineLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorName.darkJungle,
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorName.darkJungle,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorName.darkJungle,
    ),

    /// Label light
    labelLarge: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w700,
      color: ColorName.darkJungle,
    ),
    labelMedium: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w600,
      color: ColorName.darkJungle,
    ),
    labelSmall: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w500,
      color: ColorName.darkJungle,
    ),

    /// Title light
    titleLarge: TextStyle(
      fontSize: 4,
      fontWeight: FontWeight.w700,
      color: ColorName.darkJungle,
    ),
    titleMedium: TextStyle(
      fontSize: 4,
      fontWeight: FontWeight.w600,
      color: ColorName.darkJungle,
    ),
    titleSmall: TextStyle(
      fontSize: 4,
      fontWeight: FontWeight.w500,
      color: ColorName.darkJungle,
    ),
  );
}
