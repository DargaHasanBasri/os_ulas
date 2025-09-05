import '../../../export.dart';

/// [PhysicalModel]
/// `BoxDecoration.boxShadow` + `Material` + `InkWell` kombinasyonunda,
/// `Material` splash efekti gölgeyi bastırıyor ve istenilen şekilde görünmüyor.
/// - Material.elevation` sadece Material Design’ın varsayılan gölgesini veriyor,
/// özel blur, offset gibi değerleri kontrol etmeye izin vermiyor.
/// - `PhysicalModel` GPU tabanlı gerçek "physical layer shadow" üretiyor
/// ve hem splash efektini engellemiyor hem de performans olarak daha verimli.
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
          decoration: buttonBorderDecoration,
          child: Ink(
            key: const Key('custom-button-ink'),
            height: height,
            width: width,
            padding: AppPaddings.mediumHorizontal,
            decoration: buttonDefaultDecoration,
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
      text: titleGradient!,
      style: defaultStyle,
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xffF0A58E),
          Color(0xff613EEA),
        ],
      ),
    );
  }
}
