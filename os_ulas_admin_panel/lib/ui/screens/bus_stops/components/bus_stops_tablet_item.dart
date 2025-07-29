import 'package:os_ulas_admin_panel/ui/screens/bus_stops/components/bus_stops_info_label.dart';
import '../../../../export.dart';

class BusStopsTabletItem extends StatelessWidget {
  const BusStopsTabletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.mediumAll,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.05),
            blurRadius: 54,
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BusStopsInfoLabel(
                      title: LocaleKeys.busStopsScreen_infoLabelTitle1.locale,
                      subTitle: 'A101 Durağı',
                    ),
                  ),
                  Expanded(
                    child: BusStopsInfoLabel(
                      title: LocaleKeys.busStopsScreen_infoLabelTitle2.locale,
                      subTitle: '37,0665521',
                    ),
                  ),
                  Expanded(
                    child: BusStopsInfoLabel(
                      title: LocaleKeys.busStopsScreen_infoLabelTitle3.locale,
                      subTitle: '36,2422081',
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.xSmallSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BusStopsInfoLabel(
                      title: LocaleKeys.busStopsScreen_infoLabelTitle4.locale,
                      subTitle: '30.01.2025',
                    ),
                  ),
                  Expanded(
                    child: BusStopsInfoLabel(
                      title: LocaleKeys.busStopsScreen_infoLabelTitle5.locale,
                      subTitle: '30.01.2050',
                    ),
                  ),
                  Expanded(
                    child: BusStopsInfoLabel(
                      title: LocaleKeys.busStopsScreen_infoLabelTitle6.locale,
                      subTitle: 'Admin 1',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumTop,
                  child: CustomButton(
                    height: AppSizes.appButtonHeight,
                    title: LocaleKeys.viewDetails.locale,
                    backgroundColor: ColorName.aquaBlue,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.mediumSize),
              Expanded(
                child: Padding(
                  padding: AppPaddings.mediumTop,
                  child: CustomButton(
                    height: AppSizes.appButtonHeight,
                    title: LocaleKeys.delete.locale,
                    backgroundColor: ColorName.redRibbon.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
