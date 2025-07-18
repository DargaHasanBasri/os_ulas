import '../../../../export.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.magnolia,
      body: Row(
        children: [
          Expanded(child: SideBar()),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                /// header
                const HeaderLayout(),

                /// body
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        AppPaddings.xLargeHorizontal +
                        AppPaddings.mediumVertical,
                    child: body ?? SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
