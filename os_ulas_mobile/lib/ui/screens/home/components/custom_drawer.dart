import '../export.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: AppPaddings.xXLargeTop + AppPaddings.mediumBottom,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppConstants.appTitleOS,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 30,
                      color: ColorName.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppConstants.appTitleULAS,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorName.purpleBlue,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: AppPaddings.largeTop,
                  child: CustomHorizontalDivider(),
                ),
              ],
            ),
          ),
          CustomDrawerItem(
            title: 'Giriş Yap',
            icon: Assets.icons.icDrawer1.image(
              package: AppConstants.genPackageName,
            ),
            onTap: () {},
          ),
          CustomDrawerItem(
            title: 'İletişim Bilgileri',
            icon: Assets.icons.icDrawer2.image(
              package: AppConstants.genPackageName,
            ),
            onTap: () {},
          ),
          CustomDrawerItem(
            title: 'Geri Bildirim',
            icon: Assets.icons.icDrawer3.image(
              package: AppConstants.genPackageName,
            ),
            onTap: () {},
          ),
          CustomDrawerItem(
            title: 'Hakkımızda',
            icon: Assets.icons.icDrawer4.image(
              package: AppConstants.genPackageName,
            ),
            onTap: () {},
          ),
          CustomDrawerItem(
            title: 'Ayarlar',
            icon: Assets.icons.icDrawer5.image(
              package: AppConstants.genPackageName,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
