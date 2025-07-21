import '../export.dart';

final class AppRoutes {
  AppRoutes._();

  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: AppRouteNames.dashboard,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: AppRouteNames.dashboard,
          name: AppRouteNames.dashboard,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: DashboardScreen());
          },
        ),
        GoRoute(
          path: AppRouteNames.admins,
          name: AppRouteNames.admins,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: AdminsScreen());
          },
        ),
      ],
    );
  }
}
