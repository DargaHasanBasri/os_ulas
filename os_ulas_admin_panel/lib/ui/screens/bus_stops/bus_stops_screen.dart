import '../../../export.dart';
import 'components/bus_stops_desktop_item.dart';
import 'components/bus_stops_mobile_item.dart';
import 'components/bus_stops_search_filter.dart';
import 'components/bus_stops_tablet_item.dart';

class BusStopsScreen extends StatelessWidget {
  const BusStopsScreen({super.key});

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// statistics card
        Row(
          children: [
            Expanded(
              child: StatisticsCard(
                title: LocaleKeys.statisticsCard_totalStops.locale,
                description: LocaleKeys.statisticsCard_statusMsgStops.locale,
                iconImage: Assets.icons.icTotalBusStops.image(
                  package: 'gen',
                  width: 36,
                  height: 36,
                ),
                iconBackgroundColor: ColorName.eggSour,
                totalCount: 275,
              ),
            ),
            SizedBox(width: AppSizes.xLargeSize),
            Expanded(
              child: StatisticsCard(
                title: LocaleKeys.statisticsCard_goToMap.locale,
                description: LocaleKeys.statisticsCard_statusMsgMaps.locale,
                iconImage: Assets.icons.icGoMap.image(
                  package: 'gen',
                  width: 36,
                  height: 36,
                ),
                iconBackgroundColor: ColorName.lavenderMist,
                onTap: () {},
              ),
            ),
            SizedBox(width: AppSizes.xLargeSize),
            Expanded(
              child: StatisticsCard(
                title: LocaleKeys.statisticsCard_addStop.locale,
                description: LocaleKeys.statisticsCard_statusMsgAddStop.locale,
                iconImage: Assets.icons.icAddStop.image(
                  package: 'gen',
                  width: 36,
                  height: 36,
                ),
                iconBackgroundColor: ColorName.peachSchnapps,
                onTap: () {},
              ),
            ),
          ],
        ),

        /// list title and filter-search
        Padding(
          padding: AppPaddings.smallVertical,
          child: BusStopsSearchFilter(),
        ),

        /// list of bus stops
        Container(
          height: 440,
          color: ColorName.magnolia,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return BusStopsDesktopItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget tabletScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// statistics card
        Column(
          children: [
            Padding(
              padding: AppPaddings.mediumBottom,
              child: StatisticsCard(
                title: LocaleKeys.statisticsCard_totalStops.locale,
                description: LocaleKeys.statisticsCard_statusMsgStops.locale,
                iconImage: Assets.icons.icTotalBusStops.image(
                  package: 'gen',
                  width: 36,
                  height: 36,
                ),
                iconBackgroundColor: ColorName.eggSour,
                totalCount: 275,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: StatisticsCard(
                    title: LocaleKeys.statisticsCard_goToMap.locale,
                    description: LocaleKeys.statisticsCard_statusMsgMaps.locale,
                    iconImage: Assets.icons.icGoMap.image(
                      package: 'gen',
                      width: 36,
                      height: 36,
                    ),
                    iconBackgroundColor: ColorName.lavenderMist,
                    onTap: () {},
                  ),
                ),
                SizedBox(width: AppSizes.xLargeSize),
                Expanded(
                  child: StatisticsCard(
                    title: LocaleKeys.statisticsCard_addStop.locale,
                    description:
                        LocaleKeys.statisticsCard_statusMsgAddStop.locale,
                    iconImage: Assets.icons.icAddStop.image(
                      package: 'gen',
                      width: 36,
                      height: 36,
                    ),
                    iconBackgroundColor: ColorName.peachSchnapps,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),

        /// list title and filter-search
        Padding(
          padding: AppPaddings.largeVertical,
          child: BusStopsSearchFilter(),
        ),

        /// list of bus stops
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              mainAxisExtent: 180,
            ),
            itemBuilder: (context, index) {
              return BusStopsTabletItem();
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
        /// list title and filter-search
        Padding(
          padding: AppPaddings.largeVertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.busStopsScreen_mainTitle.locale,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      AppPaddings.mediumHorizontal + AppPaddings.smallVertical,
                  child: Row(
                    children: [
                      Text(
                        "${LocaleKeys.userScreen_sortBy.locale}: ",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorName.mediumGrey,
                        ),
                      ),
                      Text(
                        "Newest",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: ColorName.shipGrey,
                            ),
                      ),
                      SizedBox(width: AppSizes.xSmallSize),
                      Assets.icons.icArrowDown.image(
                        package: 'gen',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        /// statistics card
        Column(
          children: [
            StatisticsCard(
              title: LocaleKeys.statisticsCard_totalStops.locale,
              description: LocaleKeys.statisticsCard_statusMsgStops.locale,
              iconImage: Assets.icons.icTotalBusStops.image(
                package: 'gen',
                width: 36,
                height: 36,
              ),
              iconBackgroundColor: ColorName.eggSour,
              totalCount: 275,
            ),
            Padding(
              padding: AppPaddings.mediumVertical,
              child: StatisticsCard(
                title: LocaleKeys.statisticsCard_goToMap.locale,
                description: LocaleKeys.statisticsCard_statusMsgMaps.locale,
                iconImage: Assets.icons.icGoMap.image(
                  package: 'gen',
                  width: 36,
                  height: 36,
                ),
                iconBackgroundColor: ColorName.lavenderMist,
                onTap: () {},
              ),
            ),
            StatisticsCard(
              title: LocaleKeys.statisticsCard_addStop.locale,
              description: LocaleKeys.statisticsCard_statusMsgAddStop.locale,
              iconImage: Assets.icons.icAddStop.image(
                package: 'gen',
                width: 36,
                height: 36,
              ),
              iconBackgroundColor: ColorName.peachSchnapps,
              onTap: () {},
            ),
          ],
        ),

        /// list of bus stops
        Padding(
          padding: AppPaddings.mediumTop,
          child: ListView.separated(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return BusStopsMobileItem();
            },
            separatorBuilder: (context, index) {
              return Padding(padding: AppPaddings.xSmallVertical);
            },
          ),
        ),
      ],
    );
  }
}
