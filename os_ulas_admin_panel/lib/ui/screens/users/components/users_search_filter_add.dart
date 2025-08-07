import '../../../../export.dart';

class UsersSearchFilterAdd extends StatelessWidget {
  const UsersSearchFilterAdd({super.key, this.addUserOnTap});

  final VoidCallback? addUserOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.userScreen_mainTitle.locale,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Row(
          children: [
            /// TextFormField
            SizedBox(
              width: AppSizes.textFormUsersWidth,
              height: AppSizes.textFormUsersHeight,
              child: TextFormField(
                style: Theme.of(context).textTheme.labelSmall,
                decoration: InputDecoration(
                  contentPadding: AppPaddings.xXSmallVertical,
                  filled: true,
                  fillColor: ColorName.magnolia,
                  prefixIcon: Assets.icons.icSearch.image(
                    package: 'gen',
                    color: ColorName.black,
                    width: AppSizes.mediumIconSize,
                    height: AppSizes.mediumIconSize,
                  ),
                  hintText: '${LocaleKeys.search.locale}...',
                  hintStyle:
                      Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(
                        color: ColorName.mediumGrey.withValues(alpha: 0.8),
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorName.quillGrey),
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSizes.mediumSize),

            /// filter
            Container(
              decoration: BoxDecoration(
                color: ColorName.magnolia,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    AppPaddings.mediumHorizontal + AppPaddings.smallVertical,
                child: Row(
                  children: [
                    Text(
                      "${LocaleKeys.userScreen_sortBy.locale}: ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorName.mediumGrey,
                      ),
                    ),
                    Text(
                      "Newest",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorName.shipGrey,
                      ),
                    ),
                    SizedBox(width: AppSizes.xSmallSize),
                    Assets.icons.icArrowDown.image(
                      package: 'gen',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: AppSizes.mediumSize),

            /// button
            CustomButton(
              borderRadius: 8,
              title: 'Kullanıcı Ekle',
              onTap: addUserOnTap != null ? () => addUserOnTap!.call() : null,
            ),
          ],
        ),
      ],
    );
  }
}
