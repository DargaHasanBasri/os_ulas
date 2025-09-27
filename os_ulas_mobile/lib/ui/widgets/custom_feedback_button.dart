import '../../export.dart';

class CustomFeedbackButton extends StatelessWidget {
  const CustomFeedbackButton({
    super.key,
    required this.feedbackTooltipKey,
    required this.feedbackOnTap,
  });

  final GlobalKey<TooltipState> feedbackTooltipKey;
  final VoidCallback feedbackOnTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: feedbackTooltipKey,
      message: 'Geri bildirim gönder',
      waitDuration: Duration.zero,
      showDuration: const Duration(seconds: 2),
      child: GestureDetector(
        onTap: () => feedbackOnTap.call(),
        child: CircleAvatar(
          backgroundColor: ColorName.purpleBlue,
          radius: 22,
          child: Assets.icons.icFeedback.image(
            package: AppConstants.genPackageName,
            color: ColorName.white,
          ),
        ),
      ),
    );
  }
}
