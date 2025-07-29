import '../../../../export.dart';

class UsersItemTitle extends StatelessWidget {
  const UsersItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                _buildTitle(
                  context: context,
                  title: LocaleKeys.userScreen_title1.locale,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildTitle(
            context: context,
            title: LocaleKeys.userScreen_title2.locale,
          ),
        ),
        Expanded(
          flex: 4,
          child: _buildTitle(
            context: context,
            title: LocaleKeys.userScreen_title3.locale,
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildTitle(
            context: context,
            title: LocaleKeys.userScreen_title4.locale,
            isCenter: true,
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildTitle(
            context: context,
            title: LocaleKeys.userScreen_title5.locale,
            isCenter: true,
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildTitle(
            context: context,
            title: LocaleKeys.userScreen_title6.locale,
          ),
        ),
        Expanded(
          flex: 1,
          child: _buildTitle(
            context: context,
            title: LocaleKeys.userScreen_edit.locale,
          ),
        ),
      ],
    );
  }

  Text _buildTitle({
    required BuildContext context,
    required String title,
    bool isCenter = false,
  }) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: ColorName.greyCloud,
      ),
      textAlign: isCenter ? TextAlign.center : TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
