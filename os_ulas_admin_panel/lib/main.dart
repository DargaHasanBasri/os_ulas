import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_cubit.dart';
import 'export.dart';

Future<void> main() async {
  await AppStart.init();
  runApp(
    AppLocalization(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SidebarCubit>(
            create: (_) => SidebarCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'OsUlas Admin Paneli',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.light,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      routerConfig: AppRoutes.returnRouter(),
    );
  }
}
