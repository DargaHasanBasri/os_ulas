import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_cubit.dart';

import '../../../export.dart';

/// This widget returns different interfaces (desktop, tablet, mobile)
/// depending on the screen width.
/// Widget to be displayed for widescreen (e.g. desktop) devices [desktop]
/// Widget to show for medium-sized screens (e.g. tablet) [tablet]
/// Widget to be displayed for small screen devices (e.g. phone) [mobile]

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    /// Returning different widgets based on the size of the available area with LayoutBuilder,
    /// Returns the desktop view if the screen width is equal to or
    /// greater than the desktop width [AppSizes.desktopScreenSize].
    /// Returns tablet view if width is greater than or
    /// equal to tablet width [AppSizes.tabletScreenSize] and
    /// less than desktop width [AppSizes.tabletScreenSize].
    /// If the screen does not meet the other conditions,
    /// that is, if it is smaller than all of them, it returns the mobile view.
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= AppSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < AppSizes.desktopScreenSize &&
            constraints.maxWidth >= AppSizes.tabletScreenSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
