import '../../../../export.dart';

class LittleAdminDetails extends StatelessWidget {
  const LittleAdminDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.mediumAll,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.03),
            offset: Offset(6, 6),
            blurRadius: 55,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: Assets.images.imgProfileExamp.provider(
                  package: 'gen',
                ),
                radius: 32,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hasansio",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Süper Admin",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              Spacer(),
              Assets.icons.icDelete.image(
                package: 'gen',
                color: ColorName.redRibbon,
              ),
            ],
          ),
          Padding(
            padding: AppPaddings.largeVertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.adminScreen_title1.locale,
                      style: Theme.of(context).textTheme.headlineSmall,
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      color: ColorName.iron,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "E-mail",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "test@gmail.com",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      color: ColorName.iron,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Created Date",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "2025-06-20",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      color: ColorName.iron,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Admin Role",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "Süper Admin",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: AppPaddings.xSmallVertical + AppPaddings.largeHorizontal,
            decoration: BoxDecoration(
              color: ColorName.dodgerBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.adminScreen_edit.locale,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: ColorName.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: AppSizes.smallSize),
                Assets.icons.icEdit.image(
                  package: 'gen',
                  color: ColorName.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
