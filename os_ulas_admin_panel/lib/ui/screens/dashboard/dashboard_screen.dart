import '../../../export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.eggSour,
      body: Center(
        child: Assets.lottie.animConfetti.lottie(
          package: 'gen',
        ),
      ),
    );
  }
}
