import '../../../export.dart';
import 'package:os_ulas_admin_panel/ui/screens/users/components/users_desktop_list_detail.dart';
import 'package:os_ulas_admin_panel/ui/screens/users/components/users_search_filter.dart';
import 'package:os_ulas_admin_panel/ui/screens/users/components/user_list_detail.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

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
      children: [
        /// users metrics
        Padding(
          padding: AppPaddings.mediumBottom,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumRight,
                  child: MetricCard(
                    itemTitle: LocaleKeys.metricCard_activeUser.locale,
                    itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                    itemIcon: Assets.icons.icTotalActive.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.xLargeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.iceBerg,
                    totalCount: 1506,
                    percentile: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumHorizontal,
                  child: MetricCard(
                    itemTitle: LocaleKeys.metricCard_totalUsers.locale,
                    itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                    itemIcon: Assets.icons.icTotalUsers.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.xLargeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.lavenderMist,
                    totalCount: 40.689,
                    percentile: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumLeft,
                  child: MetricCard(
                    itemTitle: LocaleKeys.metricCard_totalDownloads.locale,
                    itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                    itemIcon: Assets.icons.icPlayStore.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.xLargeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.iceBerg.withValues(
                      alpha: 0.4,
                    ),
                    totalCount: 10293,
                    percentile: 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        /// users list
        Container(
          padding: AppPaddings.largeVertical + AppPaddings.xLargeHorizontal,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: ColorName.black.withValues(alpha: 0.05),
                blurRadius: 54,
                offset: Offset(6, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              UsersSearchFilter(),
              UsersDesktopList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget tabletScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// users metrics
        Column(
          children: [
            MetricCard(
              itemTitle: LocaleKeys.metricCard_activeUser.locale,
              itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
              itemIcon: Assets.icons.icTotalActive.image(
                package: 'gen',
                width: AppSizes.xLargeIconSize,
                height: AppSizes.xLargeIconSize,
              ),
              itemIconBackgroundColor: ColorName.iceBerg,
              totalCount: 1506,
              percentile: 16,
            ),
            Padding(
              padding: AppPaddings.mediumTop,
              child: Row(
                children: [
                  Expanded(
                    child: MetricCard(
                      itemTitle: LocaleKeys.metricCard_totalUsers.locale,
                      itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                      itemIcon: Assets.icons.icTotalUsers.image(
                        package: 'gen',
                        width: AppSizes.xLargeIconSize,
                        height: AppSizes.xLargeIconSize,
                      ),
                      itemIconBackgroundColor: ColorName.lavenderMist,
                      totalCount: 40.689,
                      percentile: 16,
                    ),
                  ),
                  SizedBox(width: AppSizes.largeSize),
                  Expanded(
                    child: MetricCard(
                      itemTitle: LocaleKeys.metricCard_totalDownloads.locale,
                      itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                      itemIcon: Assets.icons.icPlayStore.image(
                        package: 'gen',
                        width: AppSizes.xLargeIconSize,
                        height: AppSizes.xLargeIconSize,
                      ),
                      itemIconBackgroundColor: ColorName.iceBerg.withValues(
                        alpha: 0.4,
                      ),
                      totalCount: 10293,
                      percentile: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /// users title
        Padding(
          padding: AppPaddings.mediumTop,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// screen title
              CustomScreenTitle(
                textTitle: LocaleKeys.userScreen_mainTitle.locale,
              ),

              /// add new users button
              Row(
                children: [
                  CustomButton(
                    title: LocaleKeys.buttonTitle_addNewUser.locale,
                  ),
                  SizedBox(width: AppSizes.smallSize),
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

        /// list of users
        Padding(
          padding: AppPaddings.mediumVertical,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 34,
              mainAxisSpacing: 24,
              mainAxisExtent: 280,
            ),
            itemCount: 15,
            itemBuilder: (context, index) {
              return UserListDetails();
            },
          ),
        ),
      ],
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// users title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// screen title
            CustomScreenTitle(
              textTitle: LocaleKeys.userScreen_mainTitle.locale,
            ),

            /// add new users button
            Row(
              children: [
                CustomButton(
                  title: LocaleKeys.buttonTitle_addNewUser.locale,
                ),
                SizedBox(width: AppSizes.smallSize),
                Container(
                  padding:
                      AppPaddings.xSmallVertical + AppPaddings.smallHorizontal,
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

        /// users metrics
        Column(
          children: [
            Padding(
              padding: AppPaddings.mediumVertical,
              child: MetricCard(
                itemTitle: LocaleKeys.metricCard_activeUser.locale,
                itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                itemIcon: Assets.icons.icTotalActive.image(
                  package: 'gen',
                  width: AppSizes.xLargeIconSize,
                  height: AppSizes.xLargeIconSize,
                ),
                itemIconBackgroundColor: ColorName.iceBerg,
                totalCount: 1506,
                percentile: 16,
              ),
            ),
            MetricCard(
              itemTitle: LocaleKeys.metricCard_totalUsers.locale,
              itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
              itemIcon: Assets.icons.icTotalUsers.image(
                package: 'gen',
                width: AppSizes.xLargeIconSize,
                height: AppSizes.xLargeIconSize,
              ),
              itemIconBackgroundColor: ColorName.lavenderMist,
              totalCount: 40.689,
              percentile: 16,
            ),
            Padding(
              padding: AppPaddings.mediumVertical,
              child: MetricCard(
                itemTitle: LocaleKeys.metricCard_totalDownloads.locale,
                itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                itemIcon: Assets.icons.icPlayStore.image(
                  package: 'gen',
                  width: AppSizes.xLargeIconSize,
                  height: AppSizes.xLargeIconSize,
                ),
                itemIconBackgroundColor: ColorName.iceBerg.withValues(
                  alpha: 0.4,
                ),
                totalCount: 10293,
                percentile: 16,
              ),
            ),
          ],
        ),

        /// list of users
        ListView.separated(
          itemCount: 20,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return UserListDetails();
          },
          separatorBuilder: (_, _) {
            return SizedBox(height: AppSizes.mediumSize);
          },
        ),
      ],
    );
  }
}
