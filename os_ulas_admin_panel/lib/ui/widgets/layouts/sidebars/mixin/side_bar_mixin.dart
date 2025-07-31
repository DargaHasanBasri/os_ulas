import 'package:os_ulas_admin_panel/ui/widgets/layouts/sidebars/components/side_bar_menu_item_model.dart';
import '../../../../../export.dart';

mixin SidebarItemsMixin {
  List<SideBarMenuItemModel> get sideBarItems => [
    SideBarMenuItemModel(
      index: 0,
      itemName: 'Dashboard',
      iconBuilder: (showHighlight) {
        return Assets.icons.icDashboard.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.dashboard),
    ),
    SideBarMenuItemModel(
      index: 1,
      itemName: 'Bus Stops List',
      iconBuilder: (showHighlight) {
        return Assets.icons.icStopsList.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.busStops),
    ),
    SideBarMenuItemModel(
      index: 2,
      itemName: 'Bus Lines List',
      iconBuilder: (showHighlight) {
        return Assets.icons.icLinesList.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.busLines),
    ),
    SideBarMenuItemModel(
      index: 3,
      itemName: 'Users List',
      iconBuilder: (showHighlight) {
        return Assets.icons.icUsersList.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.users),
    ),
    SideBarMenuItemModel(
      index: 4,
      itemName: 'Admins',
      iconBuilder: (showHighlight) {
        return Assets.icons.icAdmin.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.admins),
    ),
    SideBarMenuItemModel(
      index: 5,
      itemName: 'FeedBacks',
      iconBuilder: (showHighlight) {
        return Assets.icons.icFeedback.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.admins),
    ),
    SideBarMenuItemModel(
      index: 6,
      itemName: 'Settings',
      iconBuilder: (showHighlight) {
        return Assets.icons.icSettings.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) => context.go(AppRouteNames.dashboard),
    ),
    SideBarMenuItemModel(
      index: 7,
      itemName: 'Logout',
      iconBuilder: (showHighlight) {
        return Assets.icons.icDashboard.image(
          package: 'gen',
          color: showHighlight ? Colors.white : Colors.black,
        );
      },
      onTap: (context) {
        showDialog<Widget>(
          context: context,
          builder: (context) {
            return Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                "Logout",
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
    ),
  ];
}
