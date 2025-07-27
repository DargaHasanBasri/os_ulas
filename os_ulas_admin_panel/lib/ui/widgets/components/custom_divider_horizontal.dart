import '../../../export.dart';

/// Horizontal divider component that can be reused throughout the application.
/// Customize the width with [width], the thickness with [height], and the color with [color].
/// Default values:
/// - Height: 1
/// - Width: [double.infinity]
/// - Color: [ColorName.iron]

class CustomDividerHorizontal extends StatelessWidget {
  const CustomDividerHorizontal({
    super.key,
    this.height = 1,
    this.width = double.infinity,
    this.color = ColorName.iron,
  });

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      width: width,
    );
  }
}
