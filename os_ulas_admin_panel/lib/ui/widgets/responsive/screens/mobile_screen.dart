import '../../../../export.dart';

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorName.magnolia,
      drawer: SideBar(),
      appBar: HeaderLayout(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        padding: AppPaddings.mediumAll,
        child: body ?? SizedBox(),
      ),
    );
  }
}
