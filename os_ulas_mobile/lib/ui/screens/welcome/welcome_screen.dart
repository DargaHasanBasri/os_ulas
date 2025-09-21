import 'export.dart';

class WelcomeScreen extends StatelessWidget with WelcomeScreenMixin {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.largeAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  welcomeImg(),
                  Padding(
                    padding: AppPaddings.mediumVertical,
                    child: CustomButton(
                      titleGradient: welcomeScreenGuestUser,
                      onTap: () {},
                    ),
                  ),
                  welcomeTitle(context),
                  Padding(
                    padding:
                        AppPaddings.xLargeVertical +
                        AppPaddings.largeHorizontal,
                    child: textSignInWith(context),
                  ),
                  socialButtons(),
                  Padding(
                    padding: AppPaddings.xLargeTop * 2,
                    child: appVersionInfo(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppPaddings.smallBottom,
              child: isAccountRichText(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget welcomeImg() {
    return Assets.images.imgWelcome.image(
      package: AppConstants.genPackageName,
    );
  }

  Widget welcomeTitle(BuildContext context) {
    return Text(
      welcomeScreenTitle,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }

  Widget socialButtons() {
    return Row(
      spacing: 48,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialButton(
          onTap: () => AppLogger.infoMsj('google onTap first'),
          socialIcon: Assets.icons.icGoogle.image(
            package: AppConstants.genPackageName,
          ),
        ),
        CustomSocialButton(
          onTap: () => AppLogger.infoMsj('google onTap second'),
          socialIcon: Assets.icons.icGoogle.image(
            package: AppConstants.genPackageName,
          ),
        ),
      ],
    );
  }

  Widget appVersionInfo(BuildContext context) {
    return Text(
      '1.0.0',
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }

  Widget textSignInWith(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomHorizontalDivider(),
        ),
        Padding(
          padding: AppPaddings.mediumHorizontal,
          child: Text(
            welcomeScreenSingWith,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(
              fontSize: 14,
              color: ColorName.jungleMist,
            ),
          ),
        ),
        Expanded(
          child: CustomHorizontalDivider(),
        ),
      ],
    );
  }

  Widget isAccountRichText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: welcomeScreenIsAccount,
        style: Theme.of(context).textTheme.headlineSmall,
        children: <TextSpan>[
          TextSpan(text: AppConstants.thinSpace),
          TextSpan(
            text: welcomeScreenSingUp,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(
              color: ColorName.cornflowerBlue,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppLogger.infoMsj('Sing up onTapped');
                  },
          ),
        ],
      ),
    );
  }
}
