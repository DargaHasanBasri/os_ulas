import 'export.dart';

final class AppRoutes {
  AppRoutes._();

  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: AppRouteNames.splash,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: AppRouteNames.splash,
          name: AppRouteNames.splash,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: SplashScreen());
          },
        ),

        GoRoute(
          path: AppRouteNames.onboarding,
          name: AppRouteNames.onboarding,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: OnboardingMainScreen());
          },
        ),

        GoRoute(
          path: AppRouteNames.welcome,
          name: AppRouteNames.welcome,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: WelcomeScreen());
          },
        ),

        GoRoute(
          path: AppRouteNames.home,
          name: AppRouteNames.home,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: HomeScreen());
          },
        ),
      ],
    );
  }
}
