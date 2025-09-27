import 'package:easy_localization/easy_localization.dart';
import 'export.dart';

Future<void> main() async {
  await AppStart.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeNavigationCubit>(
          create: (_) => HomeNavigationCubit(),
        ),
      ],
      child: AppLocalization(
        child: const MyApp(),
      ),
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
      themeMode: ThemeMode.system,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      home: HomeScreen(),
    );
  }
}
