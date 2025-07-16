import '../../../../export.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
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
