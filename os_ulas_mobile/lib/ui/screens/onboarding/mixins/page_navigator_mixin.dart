import '../export.dart';

/// PageNavigatorMixin provides page (PageView) management functions for StatefulWidgets.
/// [pageController] PageController provides page control to PageView.
mixin PageNavigatorMixin<T extends StatefulWidget> on State<T> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    /// The PageController is initialized.
    pageController = PageController();
  }

  /// Moves to the next page.
  /// [pageCount] total number of pages.
  void goToNextPage(BuildContext context, {required int pageCount}) {
    /// The current page index is retrieved from PageCubit.
    final currentIndex = context.read<PageCubit>().state;

    /// Next index is calculated and limited (0..pageCount-1)
    final nextIndex = (currentIndex + 1).clamp(0, pageCount - 1);

    /// Animated page transition
    pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  /// Moves to the last page.
  /// [pageCount] total number of pages.
  void goToLastPage(BuildContext context, {required int pageCount}) {
    /// Returns the last page index.
    final lastPageIndex = pageCount - 1;

    /// PageCubit state is updated.
    context.read<PageCubit>().changePage(lastPageIndex);

    /// You can go directly to the last page with the page controller (without animation).
    pageController.jumpToPage(lastPageIndex);
  }

  /// Checks if the current page is the last page.
  bool isLastPage(BuildContext context, {required int pageCount}) {
    /// Get the PageCubit state.
    final currentPage = context.watch<PageCubit>().state;

    /// Returns true if the current page is the last page.
    return currentPage == pageCount - 1;
  }

  @override
  void dispose() {
    /// PageController is cleared.
    pageController.dispose();
    super.dispose();
  }
}
