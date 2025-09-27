import 'package:flutter/material.dart';

/// ***************************************************************************
/// NavigationMixin provides helper methods for the bottom navigation bar
/// and other navigation icons in the application.
/// With this mixin, icons and selected status colors can be managed from a central location.
/// The UI layer only receives icon and color information from this mixin
/// It is independent of business logic or state management.
/// [getIcon] returns the icon to be used in the bottom navigation bar based on its index number.
/// [getIconColor] returns the color of the icon, depending on whether it is selected or not.
/// [selected] If true, it returns [selectedColor], if false, it returns [unselectedColor].
/// ***************************************************************************
mixin NavigationMixin {
  IconData getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.timelapse;
      case 1:
        return Icons.star_border_outlined;
      case 2:
        return Icons.location_on_outlined;
      case 3:
        return Icons.multiple_stop;
      case 4:
        return Icons.person_2_outlined;
      default:
        return Icons.help_outline;
    }
  }

  Color getIconColor(
    bool selected,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return selected ? selectedColor : unselectedColor;
  }
}
