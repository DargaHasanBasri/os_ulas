import '../../../export.dart';
import 'components/settings_item_title.dart';
import 'components/settings_my_details.dart';
import 'components/title_and_edit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: desktopScreen(context),
      tablet: tabletScreen(context),
      mobile: mobileScreen(context),
    );
  }

  Widget desktopScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsMyDetails(),
        Padding(
          padding: AppPaddings.mediumTop,
          child: Container(
            padding: AppPaddings.mediumVertical + AppPaddings.xLargeHorizontal,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Language',
                      ),
                    ),
                    SizedBox(width: AppSizes.mediumSize),
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Turkish',
                      ),
                    ),
                    SizedBox(width: AppSizes.largeSize),
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Theme',
                      ),
                    ),
                    SizedBox(width: AppSizes.mediumSize),
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Light',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget tabletScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsMyDetails(),
        Padding(
          padding: AppPaddings.mediumTop,
          child: Container(
            padding: AppPaddings.mediumVertical + AppPaddings.xLargeHorizontal,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Language',
                      ),
                    ),
                    SizedBox(width: AppSizes.mediumSize),
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Turkish',
                      ),
                    ),
                    SizedBox(width: AppSizes.largeSize),
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Theme',
                      ),
                    ),
                    SizedBox(width: AppSizes.mediumSize),
                    Expanded(
                      child: SettingsItemTitle(
                        title: 'Light',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileScreen(BuildContext context) {
    return Container(
      padding: AppPaddings.mediumVertical + AppPaddings.xLargeHorizontal,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.mediumBottom,
            child: TitleAndEdit(),
          ),
          CustomTextFormField(
            textFormTitle: 'Name',
            borderRadius: 8,
          ),
          Padding(
            padding: AppPaddings.mediumVertical,
            child: CustomTextFormField(
              textFormTitle: 'Role',
              borderRadius: 8,
            ),
          ),
          CustomTextFormField(
            textFormTitle: 'Email',
            borderRadius: 8,
          ),
          Padding(
            padding: AppPaddings.mediumVertical,
            child: CustomTextFormField(
              textFormTitle: 'Created Date',
              borderRadius: 8,
            ),
          ),
          Padding(
            padding: AppPaddings.mediumVertical,
            child: CustomButton(
              height: 36,
              title: 'Edit',
              onTap: () {},
            ),
          ),
          CustomButton(
            height: 36,
            title: 'Update',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
