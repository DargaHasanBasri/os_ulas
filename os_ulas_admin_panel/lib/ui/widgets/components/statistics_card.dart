import '../../../export.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconImage,
    required this.iconBackgroundColor,
    this.totalCount,
    this.onTap,
  });

  final String title;
  final String description;
  final Image iconImage;
  final Color iconBackgroundColor;
  final double? totalCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        hoverColor: ColorName.white,
        onTap: onTap != null ? () => onTap!.call() : null,
        child: Ink(
          padding: AppPaddings.mediumVertical,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: AppPaddings.xLargeLeft,
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: iconBackgroundColor,
                  child: iconImage,
                ),
              ),
              SizedBox(width: AppSizes.mediumSize),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "${totalCount ?? "·"} ${description}",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: ColorName.silverChalice,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
