import 'package:flutter/cupertino.dart';

class SideBarMenuItemModel {
  SideBarMenuItemModel({
    required this.index,
    required this.itemName,
    required this.iconBuilder,
    required this.onTap,
  });

  final int index;
  final String itemName;
  final Widget Function(bool showHighlight) iconBuilder;
  final void Function(BuildContext context) onTap;
}
