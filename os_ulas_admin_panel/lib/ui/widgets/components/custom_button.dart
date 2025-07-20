import '../../../export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title = 'default',
    this.icon,
    this.onTap,
    this.height,
    this.backgroundColor = ColorName.dodgerBlue,
    this.textColor,
    this.borderRadius = 8,
  });

  final String? title;
  final Image? icon;
  final VoidCallback? onTap;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;

    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        height: height,
        padding: AppPaddings.largeHorizontal + AppPaddings.xSmallVertical,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
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
    );
  }

  Widget buttonTitle(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(
        context,
      ).textTheme.labelMedium?.copyWith(color: ColorName.white),
      textAlign: TextAlign.center,
    );
  }
}
