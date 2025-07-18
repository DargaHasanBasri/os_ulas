import '../../../../export.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    super.key,
    required this.itemTitle,
    required this.itemMessage,
    required this.itemIcon,
    required this.itemIconBackgroundColor,
    required this.totalCount,
    required this.percentile,
  });

  final String itemTitle;
  final String itemMessage;
  final Image itemIcon;
  final Color itemIconBackgroundColor;
  final double totalCount;
  final double percentile;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: ColorName.darkJungle.withValues(alpha: 0.7),
                          ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      totalCount.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 28),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 0,
                child: Container(
                  padding: AppPaddings.mediumAll + AppPaddings.xXSmallVertical,
                  decoration: BoxDecoration(
                    color: itemIconBackgroundColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: itemIcon,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Assets.icons.icTrending.image(package: 'gen'),
              SizedBox(width: 10),
              Text(
                percentile.toString(),
                style:
                    Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(
                      color: ColorName.greenBlue,
                    ),
              ),
              Expanded(
                child: Text(
                  " $itemMessage",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorName.carbonGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
