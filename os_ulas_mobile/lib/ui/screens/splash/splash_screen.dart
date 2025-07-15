import '../../../export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.icons.icError.image(
              package: 'gen',
            ),
            Assets.lottie.animConfetti.lottie(
              package: 'gen',
            ),
            Text(LocaleKeys.appTitle.locale),
            Assets.images.imgLoading.image(
              package: 'gen',
            ),
          ],
        ),
      ),
    );
  }
}
