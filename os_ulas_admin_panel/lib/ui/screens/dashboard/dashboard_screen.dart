import 'package:os_ulas_admin_panel/ui/screens/dashboard/components/dashboard_chart.dart';
import 'package:os_ulas_admin_panel/ui/screens/dashboard/components/dashboard_item.dart';
import '../../../export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: desktopScreen(),
      tablet: tabletScreen(),
      mobile: mobileScreen(),
    );
  }

  Widget desktopScreen() {
    final now = DateTime.now();
    final List<(DateTime, double)> chartData = List.generate(14, (index) {
      final date = now.subtract(Duration(days: 13 - index));
      final value = 50 + (index % 5) * 5 + (index.isEven ? 10 : -5);
      return (date, value.toDouble());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.mediumBottom,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeRight,
                  child: DashboardItem(
                    itemTitle: LocaleKeys.metricCard_totalUsers.locale,
                    itemMessage:
                        LocaleKeys.metricCard_statusMsgYesterday.locale,
                    itemIcon: Assets.icons.icTotalUsers.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.lavenderMist,
                    totalCount: 40.689,
                    percentile: 8.5,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumRight,
                  child: DashboardItem(
                    itemTitle: LocaleKeys.metricCard_totalBusLines.locale,
                    itemMessage:
                        LocaleKeys.metricCard_statusMsgYesterday.locale,
                    itemIcon: Assets.icons.icTotalBusLines.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.bleachWhite,
                    totalCount: 15,
                    percentile: 1.8,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumLeft,
                  child: DashboardItem(
                    itemTitle: LocaleKeys.metricCard_totalBusStops.locale,
                    itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                    itemIcon: Assets.icons.icTotalBusStops.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.peachSchnapps,
                    totalCount: 40.689,
                    percentile: 4.3,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeLeft,
                  child: DashboardItem(
                    itemTitle: LocaleKeys.metricCard_totalRequestsDaily.locale,
                    itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                    itemIcon: Assets.icons.icTotalRequests.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.iceBerg,
                    totalCount: 10293,
                    percentile: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: AppPaddings.largeAll,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.xLargeBottom,
                child: Text(
                  LocaleKeys.metricCard_totalUsers.locale,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorName.darkJungle,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 3.0,
                child: DashboardChart(
                  data: chartData,
                  lineColor: ColorName.strongBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tabletScreen() {
    final now = DateTime.now();
    final List<(DateTime, double)> chartData = List.generate(14, (index) {
      final date = now.subtract(Duration(days: 13 - index));
      final value = 50 + (index % 5) * 5 + (index.isEven ? 10 : -5);
      return (date, value.toDouble());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.dashboardTitle.locale,
          style: TextStyle(
            color: ColorName.darkJungle,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: AppPaddings.mediumTop,
          child: Row(
            children: [
              Expanded(
                child: DashboardItem(
                  itemTitle: LocaleKeys.metricCard_totalUsers.locale,
                  itemMessage: LocaleKeys.metricCard_statusMsgYesterday.locale,
                  itemIcon: Assets.icons.icTotalUsers.image(
                    package: 'gen',
                    width: AppSizes.xLargeIconSize,
                    height: AppSizes.largeIconSize,
                  ),
                  itemIconBackgroundColor: ColorName.lavenderMist,
                  totalCount: 40.689,
                  percentile: 8.5,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeLeft,
                  child: DashboardItem(
                    itemTitle: LocaleKeys.metricCard_totalBusLines.locale,
                    itemMessage:
                        LocaleKeys.metricCard_statusMsgYesterday.locale,
                    itemIcon: Assets.icons.icTotalBusLines.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.bleachWhite,
                    totalCount: 15,
                    percentile: 1.8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: AppPaddings.xLargeVertical,
          child: Row(
            children: [
              Expanded(
                child: DashboardItem(
                  itemTitle: LocaleKeys.metricCard_totalBusStops.locale,
                  itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                  itemIcon: Assets.icons.icTotalBusStops.image(
                    package: 'gen',
                    width: AppSizes.xLargeIconSize,
                    height: AppSizes.largeIconSize,
                  ),
                  itemIconBackgroundColor: ColorName.peachSchnapps,
                  totalCount: 40.689,
                  percentile: 4.3,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeLeft,
                  child: DashboardItem(
                    itemTitle: LocaleKeys.metricCard_totalRequestsDaily.locale,
                    itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
                    itemIcon: Assets.icons.icTotalRequests.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    itemIconBackgroundColor: ColorName.iceBerg,
                    totalCount: 10293,
                    percentile: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: AppPaddings.largeAll,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.xLargeBottom,
                child: Text(
                  LocaleKeys.metricCard_totalUsers.locale,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorName.darkJungle,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 3.0,
                child: DashboardChart(
                  data: chartData,
                  lineColor: ColorName.strongBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mobileScreen() {
    final now = DateTime.now();
    final List<(DateTime, double)> chartData = List.generate(14, (index) {
      final date = now.subtract(Duration(days: 13 - index));
      final value = 50 + (index % 5) * 5 + (index.isEven ? 10 : -5);
      return (date, value.toDouble());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.mediumBottom,
          child: Text(
            LocaleKeys.dashboardTitle.locale,
            style: TextStyle(
              color: ColorName.darkJungle,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        DashboardItem(
          itemTitle: LocaleKeys.metricCard_totalUsers.locale,
          itemMessage: LocaleKeys.metricCard_statusMsgYesterday.locale,
          itemIcon: Assets.icons.icTotalUsers.image(
            package: 'gen',
            width: AppSizes.xLargeIconSize,
            height: AppSizes.largeIconSize,
          ),
          itemIconBackgroundColor: ColorName.lavenderMist,
          totalCount: 40.689,
          percentile: 8.5,
        ),
        Padding(
          padding: AppPaddings.mediumVertical,
          child: DashboardItem(
            itemTitle: LocaleKeys.metricCard_totalBusLines.locale,
            itemMessage: LocaleKeys.metricCard_statusMsgYesterday.locale,
            itemIcon: Assets.icons.icTotalBusLines.image(
              package: 'gen',
              width: AppSizes.xLargeIconSize,
              height: AppSizes.largeIconSize,
            ),
            itemIconBackgroundColor: ColorName.bleachWhite,
            totalCount: 15,
            percentile: 1.8,
          ),
        ),
        DashboardItem(
          itemTitle: LocaleKeys.metricCard_totalBusStops.locale,
          itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
          itemIcon: Assets.icons.icTotalBusStops.image(
            package: 'gen',
            width: AppSizes.xLargeIconSize,
            height: AppSizes.largeIconSize,
          ),
          itemIconBackgroundColor: ColorName.peachSchnapps,
          totalCount: 40.689,
          percentile: 4.3,
        ),
        Padding(
          padding: AppPaddings.mediumVertical,
          child: DashboardItem(
            itemTitle: LocaleKeys.metricCard_totalRequestsDaily.locale,
            itemMessage: LocaleKeys.metricCard_statusMsgWeek.locale,
            itemIcon: Assets.icons.icTotalRequests.image(
              package: 'gen',
              width: AppSizes.xLargeIconSize,
              height: AppSizes.largeIconSize,
            ),
            itemIconBackgroundColor: ColorName.iceBerg,
            totalCount: 10293,
            percentile: 1.3,
          ),
        ),
        Container(
          padding: AppPaddings.largeAll,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.xLargeBottom,
                child: Text(
                  LocaleKeys.metricCard_totalUsers.locale,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ColorName.darkJungle,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 3.0,
                child: DashboardChart(
                  data: chartData,
                  lineColor: ColorName.strongBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
