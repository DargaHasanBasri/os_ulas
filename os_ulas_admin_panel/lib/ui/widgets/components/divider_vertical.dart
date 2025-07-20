import '../../../export.dart';

/// Vertical divider component that can be reused throughout the application.
/// Customize the height with [height], the thickness with [width], and the color with [color].
/// Default values:
/// - Height: [AppSizes.verticalDividerHeight]
/// - Width: 1
/// - Color: [ColorName.iron]

class DividerVertical extends StatelessWidget {
  const DividerVertical({
    super.key,
    this.height = AppSizes.verticalDividerHeight,
    this.width = 1,
    this.color = ColorName.iron,
  });

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
