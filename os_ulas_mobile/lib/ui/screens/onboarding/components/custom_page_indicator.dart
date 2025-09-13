import '../export.dart';

/// The CustomPageIndicator widget provides a page indicator.
/// [count] → Total number of indicators.
/// It listens to PageCubit's state using BlocBuilder.
/// state is of type int and represents the current page index.
/// [AnimatedContainer] Creates each indicator with an AnimatedContainer.
/// [duration] Animation duration.
/// [margin] Space between indicators.
/// [width] Width 30 in active display, 10 in others.
/// [height] Height fixed.
class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            /// Check if it is active.
            final isActive = index == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 30 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: ColorName.purpleBlue,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        );
      },
    );
  }
}
