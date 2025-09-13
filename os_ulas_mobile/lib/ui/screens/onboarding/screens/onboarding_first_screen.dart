import '../export.dart';

class OnboardingFirstScreen extends StatelessWidget with ScreenTitleMixin {
  OnboardingFirstScreen({super.key});

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
            onboardingFirstScreenTitle,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: AppPaddings.largeHorizontal,
          child: Text(
            onboardingFirstScreenSubTitle,
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
