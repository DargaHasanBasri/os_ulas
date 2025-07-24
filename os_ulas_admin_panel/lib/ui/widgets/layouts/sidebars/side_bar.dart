import 'package:os_ulas_admin_panel/ui/widgets/layouts/sidebars/components/side_bar_item.dart';
import 'package:os_ulas_admin_panel/ui/widgets/layouts/sidebars/mixin/side_bar_mixin.dart';
import '../../../../export.dart';

class SideBar extends StatelessWidget with SidebarItemsMixin {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: ColorName.white,
          boxShadow: [
            BoxShadow(
              color: ColorName.black.withValues(alpha: 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: AppPaddings.mediumVertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Os",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: AppSizes.xSmallSize),
                    Assets.images.imgDirections.image(
                      package: 'gen',
                      width: AppSizes.appLogoSize,
                      height: AppSizes.appLogoSize,
                    ),
                    SizedBox(width: AppSizes.xXSmallSize),
                    Text(
                      "Ulaş",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: ColorName.dodgerBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: sideBarItems
                      .map(
                        (item) => SideBarItem(
                          index: item.index,
                          itemName: item.itemName,
                          iconBuilder: (showHighlight) =>
                              item.iconBuilder(showHighlight),
                          onTap: (context) {
                             item.onTap(context);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
