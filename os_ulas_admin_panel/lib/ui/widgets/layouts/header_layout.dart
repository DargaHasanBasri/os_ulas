import '../../../../export.dart';

class HeaderLayout extends StatelessWidget implements PreferredSizeWidget {
  const HeaderLayout({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      titleSpacing: 0,
      backgroundColor: Color(0xffFFFFFF),
      scrolledUnderElevation: 0,

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
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                width: 400,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F6FA),
                    prefixIcon: Assets.icons.icSearch.image(
                      package: 'gen',
                      color: Colors.black,
                      width: 16,
                      height: 16,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: 40,
                      minWidth: 40,
                    ),
                    hintText: 'Searching anything...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xff202224),
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xffD5D5D5)),
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
            width: 24,
            height: 24,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: EdgeInsets.all(8),
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
                    padding: const EdgeInsets.only(left: 8, right: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Hasansio',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xff404040),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Super Admin',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xff565656),
                            ),
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

  /// TODO: appBarHeight = 56 yap
  @override
  Size get preferredSize => Size.fromHeight(56 + 34);
}
