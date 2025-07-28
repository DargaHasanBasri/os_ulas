import 'package:os_ulas_admin_panel/ui/screens/dashboard/components/dashboard_chart.dart';
import '../../../export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: desktopScreen(context: context),
      tablet: tabletScreen(context: context),
      mobile: mobileScreen(context: context),
    );
  }

  Widget desktopScreen({required BuildContext context}) {
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
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalUsers.locale,
                    description:
                        LocaleKeys.metricCard_statusMsgYesterday.locale,
                    iconImage: Assets.icons.icTotalUsers.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    iconBackgroundColor: ColorName.lavenderMist,
                    totalCount: 40.689,
                    percentChange: 8.5,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumRight,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalBusLines.locale,
                    description:
                        LocaleKeys.metricCard_statusMsgYesterday.locale,
                    iconImage: Assets.icons.icTotalBusLines.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    iconBackgroundColor: ColorName.bleachWhite,
                    totalCount: 15,
                    percentChange: 1.8,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumLeft,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalBusStops.locale,
                    description: LocaleKeys.metricCard_statusMsgWeek.locale,
                    iconImage: Assets.icons.icTotalBusStops.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    iconBackgroundColor: ColorName.peachSchnapps,
                    totalCount: 40.689,
                    percentChange: 4.3,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeLeft,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalRequestsDaily.locale,
                    description: LocaleKeys.metricCard_statusMsgWeek.locale,
                    iconImage: Assets.icons.icTotalRequests.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    iconBackgroundColor: ColorName.iceBerg,
                    totalCount: 10293,
                    percentChange: 1.3,
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
                  style: Theme.of(context).textTheme.bodyLarge,
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

  Widget tabletScreen({required BuildContext context}) {
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
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: AppPaddings.mediumTop,
          child: Row(
            children: [
              Expanded(
                child: MetricCard(
                  title: LocaleKeys.metricCard_totalUsers.locale,
                  description: LocaleKeys.metricCard_statusMsgYesterday.locale,
                  iconImage: Assets.icons.icTotalUsers.image(
                    package: 'gen',
                    width: AppSizes.xLargeIconSize,
                    height: AppSizes.largeIconSize,
                  ),
                  iconBackgroundColor: ColorName.lavenderMist,
                  totalCount: 40.689,
                  percentChange: 8.5,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeLeft,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalBusLines.locale,
                    description:
                        LocaleKeys.metricCard_statusMsgYesterday.locale,
                    iconImage: Assets.icons.icTotalBusLines.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    iconBackgroundColor: ColorName.bleachWhite,
                    totalCount: 15,
                    percentChange: 1.8,
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
                child: MetricCard(
                  title: LocaleKeys.metricCard_totalBusStops.locale,
                  description: LocaleKeys.metricCard_statusMsgWeek.locale,
                  iconImage: Assets.icons.icTotalBusStops.image(
                    package: 'gen',
                    width: AppSizes.xLargeIconSize,
                    height: AppSizes.largeIconSize,
                  ),
                  iconBackgroundColor: ColorName.peachSchnapps,
                  totalCount: 40.689,
                  percentChange: 4.3,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPaddings.xLargeLeft,
                  child: MetricCard(
                    title: LocaleKeys.metricCard_totalRequestsDaily.locale,
                    description: LocaleKeys.metricCard_statusMsgWeek.locale,
                    iconImage: Assets.icons.icTotalRequests.image(
                      package: 'gen',
                      width: AppSizes.xLargeIconSize,
                      height: AppSizes.largeIconSize,
                    ),
                    iconBackgroundColor: ColorName.iceBerg,
                    totalCount: 10293,
                    percentChange: 1.3,
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
                  style: Theme.of(context).textTheme.displayLarge,
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

  Widget mobileScreen({required BuildContext context}) {
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
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        MetricCard(
          title: LocaleKeys.metricCard_totalUsers.locale,
          description: LocaleKeys.metricCard_statusMsgYesterday.locale,
          iconImage: Assets.icons.icTotalUsers.image(
            package: 'gen',
            width: AppSizes.xLargeIconSize,
            height: AppSizes.largeIconSize,
          ),
          iconBackgroundColor: ColorName.lavenderMist,
          totalCount: 40.689,
          percentChange: 8.5,
        ),
        Padding(
          padding: AppPaddings.mediumVertical,
          child: MetricCard(
            title: LocaleKeys.metricCard_totalBusLines.locale,
            description: LocaleKeys.metricCard_statusMsgYesterday.locale,
            iconImage: Assets.icons.icTotalBusLines.image(
              package: 'gen',
              width: AppSizes.xLargeIconSize,
              height: AppSizes.largeIconSize,
            ),
            iconBackgroundColor: ColorName.bleachWhite,
            totalCount: 15,
            percentChange: 1.8,
          ),
        ),
        MetricCard(
          title: LocaleKeys.metricCard_totalBusStops.locale,
          description: LocaleKeys.metricCard_statusMsgWeek.locale,
          iconImage: Assets.icons.icTotalBusStops.image(
            package: 'gen',
            width: AppSizes.xLargeIconSize,
            height: AppSizes.largeIconSize,
          ),
          iconBackgroundColor: ColorName.peachSchnapps,
          totalCount: 40.689,
          percentChange: 4.3,
        ),
        Padding(
          padding: AppPaddings.mediumVertical,
          child: MetricCard(
            title: LocaleKeys.metricCard_totalRequestsDaily.locale,
            description: LocaleKeys.metricCard_statusMsgWeek.locale,
            iconImage: Assets.icons.icTotalRequests.image(
              package: 'gen',
              width: AppSizes.xLargeIconSize,
              height: AppSizes.largeIconSize,
            ),
            iconBackgroundColor: ColorName.iceBerg,
            totalCount: 10293,
            percentChange: 1.3,
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
                  style: Theme.of(context).textTheme.displayLarge,
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
