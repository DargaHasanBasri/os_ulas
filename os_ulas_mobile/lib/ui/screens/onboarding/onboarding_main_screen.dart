import 'export.dart';

class OnboardingMainScreen extends StatefulWidget {
  OnboardingMainScreen({super.key});

  @override
  State<OnboardingMainScreen> createState() => _OnboardingMainScreenState();
}

class _OnboardingMainScreenState extends State<OnboardingMainScreen>
    with PageNavigatorMixin, ScreenTitleMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: AppPaddings.largeHorizontal,
                      child: CustomButton(
                        width: 80,
                        height: 40,
                        titleGradient: onboardingMainScreenSkipBtnTitle,
                        borderRadius: 8,
                        buttonBorderDecoration:
                            AppDecorations.defaultDecoration(),
                        onTap: () => goToLastPage(context, pageCount: 3),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      onPageChanged: (index) {
                        context.read<PageCubit>().changePage(index);
                      },
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return OnboardingFirstScreen();
                          case 1:
                            return OnboardingSecondScreen();
                          case 2:
                            return OnboardingThirdScreen();
                          default:
                            return const SizedBox.shrink(); // fallback
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: AppPaddings.largeAll,
                    child: Column(
                      children: [
                        Padding(
                          padding: AppPaddings.mediumBottom,
                          child: CustomPageIndicator(count: 3),
                        ),
                        CustomButton(
                          titleGradient:
                              isLastPage(context, pageCount: 3)
                                  ? onboardingMainScreenStartBtnTitle
                                  : onboardingMainScreenNextBtnTitle,
                          onTap: () => goToNextPage(context, pageCount: 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
