import '../../../../export.dart';

class BusStopsSearchFilter extends StatelessWidget {
  const BusStopsSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.busStopsScreen_mainTitle.locale,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Row(
          children: [
            SizedBox(
              width: AppSizes.textFormUsersWidth,
              height: AppSizes.textFormUsersHeight,
              child: TextFormField(
                style: Theme.of(context).textTheme.labelSmall,
                decoration: InputDecoration(
                  contentPadding: AppPaddings.xXSmallVertical,
                  filled: true,
                  fillColor: ColorName.white,
                  hoverColor: ColorName.white,
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
            Container(
              decoration: BoxDecoration(
                color: ColorName.white,
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
          ],
        ),
      ],
    );
  }
}
