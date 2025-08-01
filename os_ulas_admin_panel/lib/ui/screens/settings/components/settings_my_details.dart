import '../../../../export.dart';
import 'title_and_edit.dart';

class SettingsMyDetails extends StatelessWidget {
  const SettingsMyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.mediumVertical + AppPaddings.xLargeHorizontal,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppPaddings.mediumBottom,
                  child: TitleAndEdit(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            textFormTitle: 'Name',
                            borderRadius: 8,
                          ),
                          Padding(
                            padding: AppPaddings.mediumVertical,
                            child: CustomTextFormField(
                              textFormTitle: 'E-mail',
                              borderRadius: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: AppPaddings.xLargeLeft,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textFormTitle: 'Role',
                              borderRadius: 8,
                            ),
                            Padding(
                              padding: AppPaddings.mediumVertical,
                              child: CustomTextFormField(
                                textFormTitle: 'Created Date',
                                borderRadius: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        height: 36,
                        title: 'Edit',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: AppPaddings.xLargeLeft,
                        child: CustomButton(
                          height: 36,
                          title: 'Update',
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppPaddings.xLargeLeft,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: Assets.images.imgProfileExamp.provider(
                      package: 'gen',
                    ),
                    radius: 80,
                  ),
                  Padding(
                    padding: AppPaddings.xXSmallVertical,
                    child: Text(
                      'Hasan Basri Darga',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Text(
                    'SÜPER ADMİN',
                    style:
                        Theme.of(
                          context,
                        ).textTheme.labelSmall?.copyWith(
                          color: ColorName.carbonGrey,
                        ),
                  ),
                  Padding(
                    padding: AppPaddings.xXSmallVertical,
                    child: Text(
                      'dargahasan80@gmail.com',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ColorName.carbonGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '27.07.2000',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ColorName.carbonGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
