import '../../../export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title = 'default',
    this.icon,
    this.onTap,
    this.height = 30,
    this.backgroundColor = ColorName.dodgerBlue,
    this.borderRadius = 8,
    this.textStyle,
  });

  final String? title;
  final Image? icon;
  final VoidCallback? onTap;
  final double? height;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;

    return Material(
      key: const Key('custom-button-material'),
      borderRadius: BorderRadius.circular(borderRadius),
      color: Colors.transparent,
      child: InkWell(
        key: const Key('custom-button-inkWell'),
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap != null ? () => onTap!.call() : null,
        child: Ink(
          key: const Key('custom-button-ink'),
          height: height,
          padding: AppPaddings.smallHorizontal,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonTitle(context),
              if (hasIcon)
                Row(
                  children: [
                    SizedBox(height: AppSizes.smallSize),
                    icon!,
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonTitle(BuildContext context) {
    final defaultStyle =
        textStyle ??
        Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(
          color: ColorName.white,
        );
    return Text(
      title!,
      style: defaultStyle,
      textAlign: TextAlign.center,
    );
  }
}
