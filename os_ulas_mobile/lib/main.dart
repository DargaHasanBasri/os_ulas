import 'package:easy_localization/easy_localization.dart';

import 'export.dart';

Future<void> main() async{
  await AppStart.init();
  runApp(
    AppLocalization(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OsUlaş',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
      ),
      home: SplashScreen(),
    );
  }
}
