import 'package:os_ulas_admin_panel/export.dart';
import 'package:os_ulas_admin_panel/ui/widgets/components/custom_divider_horizontal.dart';

class UsersDesktopList extends StatelessWidget {
  const UsersDesktopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// users data title
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: AppPaddings.mediumVertical,
                child: Row(
                  children: [
                    Container(
                      padding: AppPaddings.smallAll,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: ColorName.artyClickBlue),
                      ),
                    ),
                    SizedBox(width: AppSizes.mediumSize),
                    Text(
                      LocaleKeys.userScreen_title1.locale,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ColorName.greyCloud,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                LocaleKeys.userScreen_title2.locale,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorName.greyCloud,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                LocaleKeys.userScreen_title3.locale,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorName.greyCloud,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                LocaleKeys.userScreen_title4.locale,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorName.greyCloud,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                LocaleKeys.userScreen_title5.locale,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorName.greyCloud,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                LocaleKeys.userScreen_title6.locale,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorName.greyCloud,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                LocaleKeys.userScreen_edit.locale,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ColorName.greyCloud,
                ),
              ),
            ),
          ],
        ),

        /// users data
        SizedBox(
          height: AppSizes.usersListHeight,
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: AppPaddings.xSmallVertical,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Container(
                            padding: AppPaddings.smallAll,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorName.artyClickBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSizes.mediumSize),
                          Expanded(
                            child: GestureDetector(
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
                                  style: Theme.of(context).textTheme.labelSmall,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
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
                                .provider(package: 'gen'),
                            radius: 16,
                          ),
                          SizedBox(width: AppSizes.xXSmallSize),
                          Expanded(
                            child: Text(
                              "User Test",
                              style: Theme.of(context).textTheme.labelSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "dargahasanbasri@gmail.com",
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "2025-06-13",
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "2025-06-13",
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "True",
                        style: Theme.of(context).textTheme.labelSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Assets.icons.icDelete.image(
                            package: 'gen',
                            width: AppSizes.mediumIconSize,
                            height: AppSizes.mediumIconSize,
                          ),
                          SizedBox(width: AppSizes.xSmallSize),
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
                padding: AppPaddings.smallVertical,
                child: CustomDividerHorizontal(),
              );
            },
          ),
        ),
      ],
    );
  }
}
