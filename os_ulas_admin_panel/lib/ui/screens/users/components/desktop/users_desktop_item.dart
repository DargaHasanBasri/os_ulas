import 'package:os_ulas_admin_panel/models/user.dart';
import 'package:os_ulas_admin_panel/ui/widgets/components/custom_check_box.dart';
import '../../../../../export.dart';
import '../../../../../viewmodel/users/check_box_cubit.dart';

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
                        user.id ?? '',
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
      ),
    );
  }
}
