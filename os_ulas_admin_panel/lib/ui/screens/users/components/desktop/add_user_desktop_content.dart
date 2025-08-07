import 'package:os_ulas_admin_panel/viewmodel/users/radio_button_cubit.dart';
import '../../../../../export.dart';

class AddUserDesktopContent extends StatelessWidget {
  const AddUserDesktopContent({super.key, this.onTapExit});

  final VoidCallback? onTapExit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.largeVertical + AppPaddings.xLargeHorizontal,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.05),
            blurRadius: 54,
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.smallTop,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.addUserDesktopContent_mainTitle.locale,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      LocaleKeys.addUserDesktopContent_subTitle.locale,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => onTapExit?.call(),
                child: Container(
                  padding: AppPaddings.smallAll,
                  decoration: BoxDecoration(
                    color: ColorName.iron,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Assets.icons.icExit.image(package: 'gen'),
                ),
              ),
            ],
          ),

          /// kullanıcı adı - kullanıcı e-mail
          Padding(
            padding: AppPaddings.largeTop,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    borderRadius: 8,
                    textFormTitle: LocaleKeys.addUserDesktopContent_name.locale,
                    hintText:
                        LocaleKeys.addUserDesktopContent_hintTextName.locale,
                  ),
                ),
                SizedBox(width: AppSizes.xLargeSize),
                Expanded(
                  child: CustomTextFormField(
                    borderRadius: 8,
                    textFormTitle:
                        LocaleKeys.addUserDesktopContent_email.locale,
                    hintText:
                        LocaleKeys.addUserDesktopContent_hintTextEmail.locale,
                  ),
                ),
              ],
            ),
          ),

          /// parola - doğrulama
          Padding(
            padding: AppPaddings.largeVertical,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    borderRadius: 8,
                    textFormTitle:
                        LocaleKeys.addUserDesktopContent_password.locale,
                    hintText: LocaleKeys
                        .addUserDesktopContent_hintTextPassword
                        .locale,
                  ),
                ),
                SizedBox(width: AppSizes.xLargeSize),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppPaddings.smallBottom,
                        child: Text(
                          LocaleKeys.addUserDesktopContent_verification.locale,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      BlocProvider(
                        create: (_) => RadioButtonCubit(),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                CustomRadioButton(
                                  index: 0,
                                  onTapTick: (isClick) {},
                                ),
                                SizedBox(width: AppSizes.xXSmallSize),
                                Text(
                                  LocaleKeys
                                      .addUserDesktopContent_verificationTrue
                                      .locale,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                            SizedBox(width: AppSizes.mediumSize),
                            Row(
                              children: [
                                CustomRadioButton(
                                  index: 1,
                                  onTapTick: (isClick) {},
                                ),
                                SizedBox(width: AppSizes.xXSmallSize),
                                Text(
                                  LocaleKeys
                                      .addUserDesktopContent_verificationFalse
                                      .locale,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomButton(
              title: 'ADD',
              width: 200,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
