import '../../../export.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.userLayout = true,
  });

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool userLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        desktop: userLayout
            ? DesktopScreen(body: desktop)
            : desktop ?? Container(),
        tablet: userLayout
            ? TabletScreen(body: tablet ?? desktop)
            : tablet ?? desktop ?? Container(),
        mobile: userLayout
            ? MobileScreen(body: mobile ?? desktop)
            : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
