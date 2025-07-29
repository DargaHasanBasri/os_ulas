import '../../../../export.dart';
import 'bus_stops_info_label.dart';

class BusStopsDesktopItem extends StatelessWidget {
  const BusStopsDesktopItem({super.key});

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
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: AppPaddings.smallHorizontal + AppPaddings.xSmallVertical,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorName.foam,
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: AppConstants.exampleID,
                    ),
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(content: Text('ID kopyalandı!')),
                  );
                },
                child: Tooltip(
                  message: AppConstants.exampleID,
                  preferBelow: false,
                  verticalOffset: 12,
                  child: Text(
                    "ID: ${AppConstants.exampleID}".shortenId,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ColorName.aquaBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BusStopsInfoLabel(
              title: LocaleKeys.busStopsScreen_infoLabelTitle1.locale,
              subTitle: 'A101 DURAĞI',
              titleTextStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
              subTitleTextStyle:
                  Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(
                    color: ColorName.rosa,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: BusStopsInfoLabel(
              title: LocaleKeys.busStopsScreen_infoLabelTitle2.locale,
              subTitle: '37,0665521',
              titleTextStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
              subTitleTextStyle:
                  Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(
                    color: ColorName.rosa,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: BusStopsInfoLabel(
              title: LocaleKeys.busStopsScreen_infoLabelTitle3.locale,
              subTitle: '36,2422081',
              titleTextStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
              subTitleTextStyle:
                  Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(
                    color: ColorName.rosa,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: BusStopsInfoLabel(
              title: LocaleKeys.busStopsScreen_infoLabelTitle4.locale,
              subTitle: '30.01.2025',
              titleTextStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
              subTitleTextStyle:
                  Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(
                    color: ColorName.rosa,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: BusStopsInfoLabel(
              title: LocaleKeys.busStopsScreen_infoLabelTitle5.locale,
              subTitle: '30.01.2100',
              titleTextStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
              subTitleTextStyle:
                  Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(
                    color: ColorName.rosa,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: CustomButton(
              title: LocaleKeys.viewDetails.locale,
              backgroundColor: ColorName.foam,
              borderRadius: 50,
              textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ColorName.aquaBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
