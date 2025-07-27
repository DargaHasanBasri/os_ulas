import '../../../../export.dart';

class AdminFilter extends StatelessWidget {
  const AdminFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Assets.icons.icFilter.image(
              package: 'gen',
              width: AppSizes.mediumIconSize,
              height: AppSizes.largeIconSize,
            ),
          ),
          CustomDividerVertical(),
          Expanded(
            child: Text(
              LocaleKeys.filterTitle_filterBy.locale,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          CustomDividerVertical(),
          Expanded(
            flex: 2,
            child: buildFilterLabel(
              context: context,
              title: LocaleKeys.filterTitle_alphabetical.locale,
              icon: Assets.icons.icArrowDown.image(
                package: 'gen',
                width: AppSizes.smallIconSize,
                height: AppSizes.xSmallIconSize,
              ),
            ),
          ),
          CustomDividerVertical(),
          Expanded(
            flex: 2,
            child: buildFilterLabel(
              context: context,
              title: LocaleKeys.filterTitle_dateTime.locale,
              icon: Assets.icons.icArrowDown.image(
                package: 'gen',
                width: AppSizes.smallIconSize,
                height: AppSizes.xSmallIconSize,
              ),
            ),
          ),
          CustomDividerVertical(),
          Expanded(
            flex: 2,
            child: buildFilterLabel(
              context: context,
              title: LocaleKeys.filterTitle_role.locale,
              icon: Assets.icons.icArrowDown.image(
                package: 'gen',
                width: AppSizes.smallIconSize,
                height: AppSizes.xSmallIconSize,
              ),
            ),
          ),
          CustomDividerVertical(),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.icRefreshFilter.image(
                  package: 'gen',
                  width: AppSizes.smallIconSize,
                  height: AppSizes.mediumIconSize,
                ),
                SizedBox(width: AppSizes.xSmallSize),
                Text(
                  LocaleKeys.filterTitle_resetFilter.locale,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorName.redRibbon,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterLabel({
    required BuildContext context,
    required String title,
    required Image icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(width: AppSizes.mediumSize),
        icon,
      ],
    );
  }
}
