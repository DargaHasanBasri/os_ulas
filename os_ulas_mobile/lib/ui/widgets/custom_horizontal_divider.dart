import '../../export.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({
    super.key,
    this.height = 1,
    this.borderRadius = 50,
    this.backgroundColor = ColorName.jungleMist,
  });

  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
    );
  }
}
