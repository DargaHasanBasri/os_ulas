import '../export.dart';

/// ***************************************************************************
/// [CustomSearchBar] is the custom search bar widget used in the application.
/// [searchTextEditingController] Manages search inputs via TextEditingController.
/// In the UI layer, it includes visuality (shadow, border radius) and
/// functionality (prefix, suffix icon).
/// [DecoratedBox] Shadow and rounded corners for the search bar.
/// [borderRadius] TextFormField corner rounding.
/// [textFormHeight] TextFormField height.
/// [backgroundColor] TextFormField background color.
/// [hintText] placeholder text.
/// [hintTextStyle] Placeholder style.
/// [prefixIcon] Search icon on the left.
/// [suffixIcon] Filter icon on the right.
/// [filterIconTap] suffixIcon function on click.
/// ***************************************************************************
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.searchTextEditingController,
    required this.filterIconTap,
  });

  final TextEditingController searchTextEditingController;
  final VoidCallback filterIconTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.10),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: CustomTextFormField(
        textEditingController: searchTextEditingController,
        borderRadius: 60,
        textFormHeight: 55,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        hintText: LocaleKeys.general_searchHintText.locale,
        hintTextStyle: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(
          color: ColorName.rockBlue,
        ),
        prefixIcon: Assets.icons.icSearch.image(
          package: AppConstants.genPackageName,
        ),
        suffixIcon: GestureDetector(
          onTap: () => filterIconTap.call(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorName.rockBlue),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 24,
              child: Assets.icons.icFilter.image(
                package: AppConstants.genPackageName,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
