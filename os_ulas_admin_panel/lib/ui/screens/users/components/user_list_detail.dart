import '../../../../export.dart';

class UserListDetails extends StatelessWidget {
  const UserListDetails({super.key});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User Test",
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(fontSize: 26),
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: "159f22d7-8249-42a4-b94e-f778d",
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ID kopyalandı!')),
                      );
                    },
                    child: Tooltip(
                      message: "159f22d7-8249-42a4-b94e-f778d",
                      preferBelow: false,
                      verticalOffset: 12,
                      child: Text(
                        "159f22d7-8249-42a4-b94e-f778d".shortenId,
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: AppSizes.xXSmallSize),
              CircleAvatar(
                backgroundImage: Assets.images.imgProfileExamp.provider(
                  package: 'gen',
                ),
                radius: 28,
              ),
            ],
          ),
          Padding(
            padding: AppPaddings.mediumTop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "User E-mail",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                ),
                SizedBox(width: AppSizes.largeSize),
                Text(
                  "dargahasanbasri@gmail.com",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.xSmallVertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Created Date:",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                ),
                SizedBox(width: 24),
                Text(
                  "2025-06-13",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Updated Date",
                style: Theme.of(
                  context,
                ).textTheme.labelSmall,
              ),
              SizedBox(width: AppSizes.largeSize),
              Text(
                "2025-06-22",
                style: Theme.of(
                  context,
                ).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Padding(
            padding: AppPaddings.xSmallVertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Verified",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                ),
                SizedBox(width: AppSizes.largeSize),
                Text(
                  "True",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.mediumTop,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        AppPaddings.xSmallVertical +
                        AppPaddings.largeHorizontal,
                    decoration: BoxDecoration(
                      color: ColorName.dodgerBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      LocaleKeys.edit.locale,
                      style:
                          Theme.of(
                            context,
                          ).textTheme.headlineLarge?.copyWith(
                            color: ColorName.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.largeSize),
                Expanded(
                  child: Container(
                    padding:
                        AppPaddings.xSmallVertical +
                        AppPaddings.largeHorizontal,
                    decoration: BoxDecoration(
                      color: ColorName.dodgerBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      LocaleKeys.delete.locale,
                      style:
                          Theme.of(
                            context,
                          ).textTheme.headlineLarge?.copyWith(
                            color: ColorName.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
