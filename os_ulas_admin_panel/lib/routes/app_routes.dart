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
        GoRoute(
          path: AppRouteNames.users,
          name: AppRouteNames.users,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: UsersScreen());
          },
        ),
        GoRoute(
          path: AppRouteNames.busStops,
          name: AppRouteNames.busStops,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: BusStopsScreen());
          },
        ),
        GoRoute(
          path: AppRouteNames.busLines,
          name: AppRouteNames.busLines,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: BusLinesScreen());
          },
        ),
        GoRoute(
          path: AppRouteNames.settings,
          name: AppRouteNames.settings,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(child: SettingsScreen());
          },
        ),
      ],
    );
  }
}
