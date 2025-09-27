import 'package:flutter_bloc/flutter_bloc.dart';

/// ***************************************************************************
/// [HomeNavigationCubit] is the Cubit class used to manage page changes
/// of the bottom navigation bar in the application.
/// It only holds the selected page index as state (int).
/// Initially, the selected page index is set to 2.
/// [changePage] is called when the user clicks the bottom bar icon and
/// updates the selected page index.
/// This method triggers a state change and the UI is automatically redrawn
/// with the BlocBuilder/BlocListener.
/// ***************************************************************************
class HomeNavigationCubit extends Cubit<int> {
  HomeNavigationCubit() : super(2);

  void changePage(int index) => emit(index);
}
