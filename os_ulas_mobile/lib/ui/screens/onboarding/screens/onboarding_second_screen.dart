import '../export.dart';

class OnboardingSecondScreen extends StatelessWidget with ScreenTitleMixin {
  const OnboardingSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.imgOnboardingFirst.image(
          package: AppConstants.genPackageName,
        ),
        Padding(
          padding: AppPaddings.largeAll,
          child: Text(
            onboardingSecondScreenTitle,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: AppPaddings.largeHorizontal,
          child: Text(
            onboardingSecondScreenSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(
              color: ColorName.paleSky,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
