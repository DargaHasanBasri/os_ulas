import 'export.dart';

class SplashScreen extends StatelessWidget with SplashScreenMixin {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startAnimation(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorName.blush,
                ColorName.purpleBlue,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<SplashCubit, SplashState>(
                builder: (context, state) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(state.angle),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Assets.images.osUlasAppLogo.image(
                          package: AppConstants.genPackageName,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: AppPaddings.mediumTop,
                child: Center(
                  child: CustomAnimationText(
                    text: splashTitleAndSubtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge?.copyWith(
                      color: ColorName.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
