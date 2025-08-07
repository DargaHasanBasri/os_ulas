import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButtonCubit extends Cubit<int?> {
  RadioButtonCubit() : super(null);

  void select(int index) {
    if (state == index) {
      emit(null);
    } else {
      emit(index);
    }
  }
}
