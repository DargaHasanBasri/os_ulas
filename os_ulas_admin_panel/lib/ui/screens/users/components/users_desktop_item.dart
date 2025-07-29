import '../../../../export.dart';

class UsersDesktopItem extends StatelessWidget {
  const UsersDesktopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        text: AppConstants.exampleID,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ID kopyalandı!')),
                    );
                  },
                  child: Tooltip(
                    message: AppConstants.exampleID,
                    preferBelow: false,
                    verticalOffset: 12,
                    child: Text(
                      AppConstants.exampleID.shortenId,
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
                backgroundImage: Assets.images.imgProfileExamp.provider(
                  package: 'gen',
                ),
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
    );
  }
}
