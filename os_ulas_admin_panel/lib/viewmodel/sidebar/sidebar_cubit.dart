import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_admin_panel/viewmodel/sidebar/sidebar_state.dart';

/// [SidebarCubit] is the Cubit that handles the selected and hover states in the left menu.
/// Controls which menu item is selected or hovered over in the application.
class SidebarCubit extends Cubit<SidebarState> {
  /// Initial state: [selectedIndex] = 0 (first menu item selected).
  SidebarCubit() : super(const SidebarState(selectedIndex: 0));

  /// Called when a menu item is selected.
  /// Takes the current state and creates a new state by replacing
  /// the [selectedIndex] field with a new value [index].
  void selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  /// Called when the mouse hovers over or exits a menu item.
  /// If [index] is not null, it indicates the hovered item; if null,
  /// it indicates the hover is cleared.
  /// Takes the current state and creates a new state by replacing
  /// the [hoveredIndex] field with a new value [index].
  void setHover(int? index) {
    emit(state.copyWith(hoveredIndex: index));
  }
}
