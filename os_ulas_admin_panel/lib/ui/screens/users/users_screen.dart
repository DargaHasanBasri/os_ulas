import '../../../export.dart';
import 'components/desktop/add_user_desktop_content.dart';
import 'components/user_list_detail.dart';
import 'components/desktop/users_desktop_item.dart';
import 'components/users_item_title.dart';
import 'components/users_search_filter_add.dart';

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
                    title: LocaleKeys.metricCard_activeUser.locale,
                    description: LocaleKeys.metricCard_statusMsgWeek.locale,
                    iconImage: Assets.icons.icTotalActive.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.xLargeIconSize,
                    ),
                    iconBackgroundColor: ColorName.iceBerg,
                    totalCount: 1506,
                    percentChange: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumHorizontal,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalUsers.locale,
                    description: LocaleKeys.metricCard_statusMsgWeek.locale,
                    iconImage: Assets.icons.icTotalUsers.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.xLargeIconSize,
                    ),
                    iconBackgroundColor: ColorName.lavenderMist,
                    totalCount: 40.689,
                    percentChange: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumLeft,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalDownloads.locale,
                    description: LocaleKeys.metricCard_statusMsgWeek.locale,
                    iconImage: Assets.icons.icPlayStore.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.xLargeIconSize,
                    ),
                    iconBackgroundColor: ColorName.iceBerg.withValues(
                      alpha: 0.4,
                    ),
                    totalCount: 10293,
                    percentChange: 16,
                  ),
                ),
              ),
            ],
          ),
        ),

        /// lift of users
        BlocProvider(
          create: (_) => VisibilityCubit(),
          child: BlocBuilder<VisibilityCubit, bool>(
            builder: (context, isVisible) {
              return isVisible
                  ? Container(
                      padding:
                          AppPaddings.largeVertical +
                          AppPaddings.xLargeHorizontal,
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
                          UsersSearchFilterAdd(
                            addUserOnTap: () => context
                                .read<VisibilityCubit>()
                                .toggleVisibility(),
                          ),
                          UsersItemTitle(),
                          SizedBox(
                            height: AppSizes.usersListHeight,
                            child: ListView.separated(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return UsersDesktopItem(
                                  onTapTick: (isClick) {},
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: AppPaddings.smallVertical,
                                  child: CustomDividerHorizontal(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : AddUserDesktopContent(
                      onTapExit: () =>
                          context.read<VisibilityCubit>().toggleVisibility(),
                    );
            },
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
              title: LocaleKeys.metricCard_activeUser.locale,
              description: LocaleKeys.metricCard_statusMsgWeek.locale,
              iconImage: Assets.icons.icTotalActive.image(
                package: 'gen',
                width: AppSizes.xLargeIconSize,
                height: AppSizes.xLargeIconSize,
              ),
              iconBackgroundColor: ColorName.iceBerg,
              totalCount: 1506,
              percentChange: 16,
            ),
            Padding(
              padding: AppPaddings.mediumTop,
              child: Row(
                children: [
                  Expanded(
                    child: MetricCard(
                      title: LocaleKeys.metricCard_totalUsers.locale,
                      description: LocaleKeys.metricCard_statusMsgWeek.locale,
                      iconImage: Assets.icons.icTotalUsers.image(
                        package: 'gen',
                        width: AppSizes.xLargeIconSize,
                        height: AppSizes.xLargeIconSize,
                      ),
                      iconBackgroundColor: ColorName.lavenderMist,
                      totalCount: 40.689,
                      percentChange: 16,
                    ),
                  ),
                  SizedBox(width: AppSizes.largeSize),
                  Expanded(
                    child: MetricCard(
                      title: LocaleKeys.metricCard_totalDownloads.locale,
                      description: LocaleKeys.metricCard_statusMsgWeek.locale,
                      iconImage: Assets.icons.icPlayStore.image(
                        package: 'gen',
                        width: AppSizes.xLargeIconSize,
                        height: AppSizes.xLargeIconSize,
                      ),
                      iconBackgroundColor: ColorName.iceBerg.withValues(
                        alpha: 0.4,
                      ),
                      totalCount: 10293,
                      percentChange: 16,
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
                title: LocaleKeys.userScreen_mainTitle.locale,
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
              mainAxisExtent: 320,
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
              title: LocaleKeys.userScreen_mainTitle.locale,
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
                title: LocaleKeys.metricCard_activeUser.locale,
                description: LocaleKeys.metricCard_statusMsgWeek.locale,
                iconImage: Assets.icons.icTotalActive.image(
                  package: 'gen',
                  width: AppSizes.xLargeIconSize,
                  height: AppSizes.xLargeIconSize,
                ),
                iconBackgroundColor: ColorName.iceBerg,
                totalCount: 1506,
                percentChange: 16,
              ),
            ),
            MetricCard(
              title: LocaleKeys.metricCard_totalUsers.locale,
              description: LocaleKeys.metricCard_statusMsgWeek.locale,
              iconImage: Assets.icons.icTotalUsers.image(
                package: 'gen',
                width: AppSizes.xLargeIconSize,
                height: AppSizes.xLargeIconSize,
              ),
              iconBackgroundColor: ColorName.lavenderMist,
              totalCount: 40.689,
              percentChange: 16,
            ),
            Padding(
              padding: AppPaddings.mediumVertical,
              child: MetricCard(
                title: LocaleKeys.metricCard_totalDownloads.locale,
                description: LocaleKeys.metricCard_statusMsgWeek.locale,
                iconImage: Assets.icons.icPlayStore.image(
                  package: 'gen',
                  width: AppSizes.xLargeIconSize,
                  height: AppSizes.xLargeIconSize,
                ),
                iconBackgroundColor: ColorName.iceBerg.withValues(
                  alpha: 0.4,
                ),
                totalCount: 10293,
                percentChange: 16,
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
