import '../../../export.dart';

class AdminsScreen extends StatelessWidget {
  const AdminsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: desktopScreen(context),
      tablet: tabletScreen(context),
      mobile: mobileScreen(context),
    );
  }

  Widget desktopScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// filter admins
        Padding(
          padding: AppPaddings.mediumBottom,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// filter labels
              Expanded(child: AdminFilter()),

              /// add new admin button
              Container(
                margin: AppPaddings.xXLargeLeft,
                padding:
                    AppPaddings.xSmallVertical + AppPaddings.largeHorizontal,
                decoration: BoxDecoration(
                  color: ColorName.dodgerBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  LocaleKeys.buttonTitle_addNewAdmin.locale,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: ColorName.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        /// Admin details
        AdminDetails(),
      ],
    );
  }

  Widget tabletScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppPaddings.largeBottom,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// screen title
              Text(
                LocaleKeys.adminScreen_mainTitle.locale,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              /// add new admins button
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomButton(
                    title: LocaleKeys.buttonTitle_addNewAdmin.locale,
                  ),
                  SizedBox(height: AppSizes.smallSize),
                  Container(
                    padding:
                        AppPaddings.xSmallVertical +
                        AppPaddings.smallHorizontal,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Assets.icons.icFilter.image(
                      package: 'gen',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// list of admins
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 34,
            mainAxisSpacing: 16,
            mainAxisExtent: 380,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return LittleAdminDetails();
          },
        ),
      ],
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.largeBottom,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// screen title
              Text(
                LocaleKeys.adminScreen_mainTitle.locale,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              /// add new admins button
              Row(
                children: [
                  CustomButton(
                    title: LocaleKeys.buttonTitle_addNewAdmin.locale,
                  ),
                  SizedBox(width: AppSizes.smallSize),
                  Container(
                    padding:
                        AppPaddings.largeHorizontal +
                        AppPaddings.xSmallVertical,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Assets.icons.icFilter.image(
                      package: 'gen',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return LittleAdminDetails();
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: AppSizes.mediumSize);
          },
        ),
      ],
    );
  }
}
