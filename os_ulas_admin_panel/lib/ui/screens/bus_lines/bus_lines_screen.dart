import '../../../export.dart';
import 'components/desktop/bus_lines_desktop_item.dart';
import 'components/desktop/bus_lines_desktop_item_title.dart';
import 'components/bus_lines_search_filter.dart';
import 'components/mobile/bus_lines_mobile_item.dart';
import 'components/tablet/bus_lines_tablet_item.dart';
import 'components/tablet/bus_lines_tablet_item_title.dart';

class BusLinesScreen extends StatelessWidget {
  const BusLinesScreen({super.key});

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
                title: 'Toplam Hat',
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
                title: 'Hat Ekle',
                description: 'Yeni Hat Ekleyebilirsiniz',
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

        /// list of bus lines
        Padding(
          padding: AppPaddings.mediumVertical,
          child: Container(
            padding: AppPaddings.xLargeHorizontal + AppPaddings.mediumVertical,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                /// list title and filter-search
                BusLinesSearchFilter(),
                Padding(
                  padding: AppPaddings.mediumTop + AppPaddings.xSmallBottom,
                  child: BusLinesDesktopItemTitle(),
                ),

                /// list of bus lines
                SizedBox(
                  height: 380,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      final isTrue = index % 2 != 0;
                      return BusLinesDesktopItem(isDarkBackground: isTrue);
                    },
                  ),
                ),
              ],
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
        Row(
          children: [
            Expanded(
              child: StatisticsCard(
                title: 'Toplam Hat',
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
                title: 'Hat Ekle',
                description: 'Yeni Hat Ekleyebilirsiniz',
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

        /// list of bus lines
        Padding(
          padding: AppPaddings.mediumVertical,
          child: Container(
            padding: AppPaddings.xLargeHorizontal + AppPaddings.mediumVertical,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                /// list title and filter-search
                BusLinesSearchFilter(),
                Padding(
                  padding: AppPaddings.mediumTop + AppPaddings.xSmallBottom,
                  child: BusLinesTabletItemTitle(),
                ),

                /// list of bus lines
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      final isTrue = index % 2 != 0;
                      return BusLinesTabletItem(isDarkBackground: isTrue);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// list title and filter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Otobüs Hatları',
              style: Theme.of(context).textTheme.displayMedium,
            ),

            /// TODO: make it custom
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

        /// statistics card
        Padding(
          padding: AppPaddings.mediumTop,
          child: Column(
            children: [
              StatisticsCard(
                title: 'Toplam Hat',
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
                  title: 'Hat Ekle',
                  description: 'Yeni Hat Ekleyebilirsiniz',
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
        ),

        /// list of bus stops
        ListView.separated(
          itemCount: 20,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BusLinesMobileItem();
          },
          separatorBuilder: (context, index) {
            return Padding(padding: AppPaddings.xSmallVertical);
          },
        ),
      ],
    );
  }
}
