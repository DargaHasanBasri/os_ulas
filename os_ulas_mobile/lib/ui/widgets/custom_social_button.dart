import '../../export.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.onTap,
    this.backgroundColor = ColorName.alabaster,
    this.borderRadius = 50,
    this.socialIcon,
  });

  final VoidCallback onTap;
  final Color? backgroundColor;
  final double? borderRadius;
  final Image? socialIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        padding: AppPaddings.smallAll,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child:
            socialIcon ??
            Assets.icons.icGoogle.image(
              package: AppConstants.genPackageName,
            ),
      ),
    );
  }
}
