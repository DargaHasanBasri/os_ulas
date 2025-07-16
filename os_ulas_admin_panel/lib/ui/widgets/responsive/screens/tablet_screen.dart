import '../../../../export.dart';

class TabletScreen extends StatelessWidget {
  TabletScreen({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffF5F6FA),
      drawer: SideBar(),
      appBar: HeaderLayout(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: body ?? SizedBox(),
        ),
      ),
    );
  }
}
