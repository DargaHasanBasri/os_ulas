import '../../../export.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconImage,
    required this.iconBackgroundColor,
    required this.totalCount,
    required this.percentChange,
  });

  final String title;
  final String description;
  final Image iconImage;
  final Color iconBackgroundColor;
  final double totalCount;
  final double percentChange;

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
                      title,
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
                  /// TODO: check the padding
                  padding: AppPaddings.mediumAll + AppPaddings.xXSmallVertical,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: FittedBox(
                    key: const Key('metric_icon_image'),
                    fit: BoxFit.contain,
                    child: iconImage,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Assets.icons.icTrending.image(
                key: const Key('metric_trending_icon'),
                package: 'gen',
              ),
              SizedBox(width: 10),
              Text(
                '%${percentChange}',
                style:
                    Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(
                      color: ColorName.greenBlue,
                    ),
              ),
              Expanded(
                child: Text(
                  " $description",
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
