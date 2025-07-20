import '../../../../export.dart';

class AdminDetails extends StatelessWidget {
  const AdminDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.xLargeHorizontal + AppPaddings.mediumVertical,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// admins data title
          Container(
            decoration: BoxDecoration(
              color: ColorName.magnolia,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: AppPaddings.largeHorizontal,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: AppPaddings.mediumVertical,
                      child: Row(
                        children: [
                          Container(
                            /// TODO: check the padding
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorName.artyClickBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSizes.mediumSize),
                          Text(
                            LocaleKeys.adminScreen_title1.locale,
                            style: Theme.of(context).textTheme.labelLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: AppPaddings.mediumVertical,
                      child: Text(
                        LocaleKeys.adminScreen_title2.locale,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: AppPaddings.mediumVertical,
                      child: Text(
                        LocaleKeys.adminScreen_title3.locale,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: AppPaddings.mediumVertical,
                      child: Center(
                        child: Text(
                          LocaleKeys.adminScreen_title4.locale,
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: AppPaddings.mediumVertical,
                      child: Text(
                        LocaleKeys.adminScreen_title5.locale,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: AppPaddings.mediumVertical,
                      child: Text(
                        LocaleKeys.adminScreen_edit.locale,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// admins data
          SizedBox(
            height: 500,
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      AppPaddings.largeHorizontal + AppPaddings.mediumVertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: ColorName.artyClickBlue,
                                ),
                              ),
                            ),
                            SizedBox(width: AppSizes.mediumSize),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text:
                                        "159f22d7-8249-42a4-b94e-f778dc8ab404",
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
                                  style: Theme.of(context).textTheme.labelSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: Assets.images.imgProfileExamp
                                  .provider(
                                    package: 'gen',
                                  ),
                              radius: 20,
                            ),
                            SizedBox(width: AppSizes.xSmallSize),
                            Expanded(
                              child: Text(
                                "Super Admin Test",
                                style: Theme.of(context).textTheme.labelSmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "dargahasanbasri@gmail.com",
                          style: Theme.of(context).textTheme.labelSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            "2025-06-13",
                            style: Theme.of(context).textTheme.labelSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: ColorName.artyClickBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Super Admin",
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: ColorName.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.icDelete.image(
                              package: 'gen',
                              width: AppSizes.mediumIconSize,
                              height: AppSizes.mediumIconSize,
                            ),
                            SizedBox(width: AppSizes.mediumSize),
                            Assets.icons.icEdit.image(
                              package: 'gen',
                              width: AppSizes.mediumIconSize,
                              height: AppSizes.mediumIconSize,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding:
                      AppPaddings.largeHorizontal + AppPaddings.xSmallVertical,
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      color: ColorName.iron,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
