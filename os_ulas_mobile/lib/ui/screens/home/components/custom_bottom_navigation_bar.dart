import '../export.dart';

/// ***************************************************************************
/// [CustomBottomNavBar] represents the bottom navigation bar in the application.
/// Manages page changes together with [HomeNavigationCubit].
/// A custom-shaped and shaded bottom bar was designed using the CurvedNavigationBar package.
/// [_bottomNavigationKey] The global key used to access the state of the CurvedNavigationBar.
/// Listens to the [HomeNavigationCubit] state with BlocBuilder.
/// When the state changes, the bottom bar is automatically redrawn.
/// [DecoratedBox] Adds shadow and rounded corners to the bottom bar.
/// Base [color] of the bottom bar.
/// [state] Selected page index.
/// [backgroundColor] Bottom bar background transparent.
/// [buttonBackgroundColor] Background color of the selected icon.
/// [selected] Checking if it is selected.
/// [getIcon] from NavigationMixin retrieves the icon by index.
/// [getIconColor] from NavigationMix determines the color of the icon depending
/// on whether it is selected or not.
/// [onTap] Notify page change via Cubit based on icon click status.
/// ***************************************************************************
class CustomBottomNavBar extends StatelessWidget with NavigationMixin {
  CustomBottomNavBar({super.key});

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigationCubit, int>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: ColorName.black.withValues(alpha: 0.1),
                blurRadius: 50,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            color: Theme.of(context).colorScheme.tertiary,
            index: state,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: ColorName.purpleBlue,
            items: List.generate(5, (i) {
              bool selected = state == i;
              return Padding(
                padding: AppPaddings.smallAll,
                child: Icon(
                  getIcon(i),
                  color: getIconColor(
                    selected,
                    ColorName.white,
                    ColorName.rockBlue,
                  ),
                ),
              );
            }),
            onTap: (index) {
              context.read<HomeNavigationCubit>().changePage(index);
            },
          ),
        );
      },
    );
  }
}
