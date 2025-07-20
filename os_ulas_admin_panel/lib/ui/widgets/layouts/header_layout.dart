import '../../../../export.dart';

class HeaderLayout extends StatelessWidget implements PreferredSizeWidget {
  const HeaderLayout({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSizes.appBarHeight,
      titleSpacing: AppSizes.appZero,
      backgroundColor: ColorName.white,
      scrolledUnderElevation: AppSizes.appZero,

      /// mobile menu
      leading: !DeviceUtility.isDesktopScreen(context)
          ? IconButton(
              onPressed: () => scaffoldKey?.currentState?.openDrawer(),
              icon: Icon(Icons.menu),
            )
          : null,

      title:
          /// search text form field
          DeviceUtility.isDesktopScreen(context)
          ? Padding(
              padding: AppPaddings.xLargeLeft,
              child: SizedBox(
                width: AppSizes.textFormWidth,
                height: AppSizes.textFormHeight,
                child: TextFormField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  decoration: InputDecoration(
                    contentPadding: AppPaddings.smallAll,
                    filled: true,
                    fillColor: ColorName.magnolia,
                    prefixIcon: Assets.icons.icSearch.image(
                      package: 'gen',
                      color: ColorName.black,
                      width: AppSizes.mediumIconSize,
                      height: AppSizes.mediumIconSize,
                    ),
                    hintText: 'Searching anything...',
                    hintStyle: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(
                          fontSize: 14,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: ColorName.quillGrey),
                    ),
                  ),
                ),
              ),
            )
          : null,

      actions: [
        /// search button on mobile
        if (!DeviceUtility.isDesktopScreen(context))
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),

        /// notifications button
        IconButton(
          onPressed: () {},
          icon: Assets.icons.icNotification.image(
            package: 'gen',
            width: AppSizes.largeIconSize,
            height: AppSizes.largeIconSize,
          ),
        ),

        Padding(
          padding: AppPaddings.mediumVertical,
          child: Container(
            padding: AppPaddings.smallAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// user profile
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Assets.images.imgProfileExamp.image(
                      package: 'gen',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// user info
                if (!DeviceUtility.isMobileScreen(context))
                  Padding(
                    padding: AppPaddings.smallLeft + AppPaddings.xLargeRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Hasansio',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                fontSize: 14,
                                color: ColorName.charcoalGrey,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            'Super Admin',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 12,
                                  color: ColorName.davyGrey,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.appBarHeight);
}
