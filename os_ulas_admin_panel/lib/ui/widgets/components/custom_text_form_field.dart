import '../../../export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.backgroundColor = ColorName.magnolia,
    this.prefixIcon,
    this.hintText = '',
    this.hintTextStyle,
    this.borderRadius = 16,
    this.focusedBorderColor = ColorName.quillGrey,
    this.textFormTitle,
    this.textFormHeight = 36,
    this.textFormWidth,
  });

  final Color? backgroundColor;
  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final double? borderRadius;
  final Color? focusedBorderColor;
  final String? textFormTitle;
  final double? textFormHeight;
  final double? textFormWidth;

  @override
  Widget build(BuildContext context) {
    return textFormTitle != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppPaddings.smallBottom,
                child: Text(
                  textFormTitle!,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              _buildTextFormField(context),
            ],
          )
        : _buildTextFormField(context);
  }

  Widget _buildTextFormField(BuildContext context) {
    return SizedBox(
      width: textFormWidth,
      height: textFormHeight,
      child: TextFormField(
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          contentPadding: _contentPadding(),
          filled: true,
          fillColor: backgroundColor,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: _defaultHintTextStyle(context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: focusedBorderColor!),
          ),
        ),
      ),
    );
  }

  TextStyle? _defaultHintTextStyle(BuildContext context) {
    final defaultHintTextStyle = hintTextStyle != null
        ? Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(
            color: ColorName.mediumGrey.withValues(alpha: 0.8),
          )
        : null;
    return defaultHintTextStyle;
  }

  EdgeInsetsGeometry _contentPadding() {
    final contentPadding = prefixIcon != null
        ? AppPaddings.xXSmallVertical
        : AppPaddings.xXSmallVertical +
              AppPaddings.mediumLeft +
              AppPaddings.xSmallRight;
    return contentPadding;
  }
}

/*
Assets.icons.icSearch.image(
          package: 'gen',
          color: ColorName.black,
          width: AppSizes.mediumIconSize,
          height: AppSizes.mediumIconSize,
        )
        hintText
        /// ${LocaleKeys.search.locale}...
 */
