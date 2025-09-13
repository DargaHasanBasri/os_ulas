import '../../export.dart';

/// [PhysicalModel]
/// In the combination of `BoxDecoration.boxShadow` + `Material` + `InkWell`,
/// The `Material` splash effect overwhelms the shadow and does not appear as intended.
/// Material.elevation` just gives the default Material Design shadow,
/// It does not allow controlling custom values such as blur and offset.
/// - `PhysicalModel` produces GPU-based real "physical layer shadow" and
/// does not prevent the splash effect and is more efficient in terms of performance.
/// [titleDefault] plain text title.
/// [titleGradient] gradient post title.
/// [icon] button icon.
/// [onTap] click event.
/// [height] button height default 50.
/// [borderRadius] corner rounding default 40.
/// [textStyle] button title text style.
/// [width] button width default 50.
/// [buttonDefaultDecoration] default button interior decoration.
/// [buttonBorderDecoration] button edge decoration.
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.titleDefault,
    this.titleGradient,
    this.icon,
    this.onTap,
    this.height = 50,
    this.borderRadius = 40,
    this.textStyle,
    this.width,
    this.buttonDefaultDecoration,
    this.buttonBorderDecoration,
  });

  final String? titleDefault;
  final String? titleGradient;
  final Image? icon;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Decoration? buttonDefaultDecoration;
  final Decoration? buttonBorderDecoration;

  @override
  Widget build(BuildContext context) {
    /// Check if there is an icon
    final hasIcon = icon != null;
    return PhysicalModel(
      key: const Key('custom-button-material'),
      borderRadius: BorderRadius.circular(borderRadius!),
      color: Colors.transparent,
      child: InkWell(
        key: const Key('custom-button-inkWell'),
        borderRadius: BorderRadius.circular(borderRadius!),
        onTap: onTap != null ? () => onTap!.call() : null,
        child: Ink(
          padding: const EdgeInsets.all(1),
          decoration:
              buttonBorderDecoration ??
              AppDecorations.borderGradientDecoration(
                borderRadius: borderRadius!,
              ),
          child: Ink(
            key: const Key('custom-button-ink'),
            height: height,
            width: width,
            padding: AppPaddings.mediumHorizontal,
            decoration:
                buttonDefaultDecoration ??
                AppDecorations.defaultDecoration(borderRadius: borderRadius!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child:
                      titleDefault != null
                          ? _buttonTitle(context)
                          : _buttonGradientTitle(context),
                ),
                if (hasIcon)
                  Row(
                    children: [
                      SizedBox(width: AppSizes.xSmallSize),
                      icon!,
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Normal header widget
  Widget _buttonTitle(BuildContext context) {
    final defaultStyle =
        textStyle ??
        Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(
          color: ColorName.white,
          fontSize: 18,
        );
    return Text(
      titleDefault!,
      style: defaultStyle,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Gradient header widget
  Widget _buttonGradientTitle(BuildContext context) {
    final defaultStyle =
        textStyle ??
        Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(
          color: ColorName.white,
          fontSize: 18,
        );
    return CustomGradientText(
      text: titleGradient ?? 'Default',
      style: defaultStyle,
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          ColorName.blush,
          ColorName.purpleBlue,
        ],
      ),
    );
  }
}
