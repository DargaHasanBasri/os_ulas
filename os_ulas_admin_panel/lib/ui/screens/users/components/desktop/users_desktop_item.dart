import '../../../../../export.dart';

class UsersDesktopItem extends StatelessWidget {
  const UsersDesktopItem({super.key, this.onTapTick, required this.user});

  final void Function(bool isClick)? onTapTick;
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckBoxCubit(),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CustomCheckBox(
                  onTapTick: (isClick) => onTapTick != null
                      ? () {
                          onTapTick?.call(isClick);
                        }
                      : null,
                ),
                SizedBox(width: AppSizes.mediumSize),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: user.id ?? '',
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('ID kopyalandı!')),
                      );
                    },
                    child: Tooltip(
                      message: user.id ?? '',
                      preferBelow: false,
                      verticalOffset: 12,
                      child: Text(
                        "${user.id ?? ''}".shortenId,
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
                    user.name ?? '',
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
              user.email ?? '',
              style: Theme.of(context).textTheme.labelSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "${user.createdAt?.toDayMonthYear() ?? ''}",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "${user.updatedAt?.toDayMonthYear() ?? ''}",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "${user.isVerified.toString().toUpperCase()}",
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
  }
}
