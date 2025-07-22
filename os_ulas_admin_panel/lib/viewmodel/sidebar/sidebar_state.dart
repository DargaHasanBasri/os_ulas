import 'package:equatable/equatable.dart';

/// [SidebarState] is the state of the [SidebarCubit].
/// Keeps the selected and hovered menu indexes.
/// [selectedIndex] holds the index of the currently selected menu item.
/// [hoveredIndex] holds the index of the hovered menu item (or null).
class SidebarState extends Equatable {
  const SidebarState({
    required this.selectedIndex,
    this.hoveredIndex,
  });

  final int selectedIndex;
  final int? hoveredIndex;

  /// Creates a new SidebarState, copies the current state
  /// and overwrites it with the new values.
  /// If a parameter is null, it keeps the current value.
  SidebarState copyWith({
    int? selectedIndex,
    int? hoveredIndex,
  }) {
    return SidebarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      hoveredIndex: hoveredIndex,
    );
  }

  /// With Equatable, two SidebarState objects are considered equal
  /// if their contents are the same.
  @override
  List<Object?> get props => [selectedIndex, hoveredIndex];
}
