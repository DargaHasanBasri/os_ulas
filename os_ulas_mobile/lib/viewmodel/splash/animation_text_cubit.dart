import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'animation_text_state.dart';

class AnimationTextCubit extends Cubit<AnimationTextState> {
  final String text;

  AnimationTextCubit(this.text)
    : super(
        AnimationTextState(List.filled(text.replaceAll('\n', '').length, 0)),
      );

  void startAnimation({
    int lettersPerStep = 2,
    Duration stepDuration = const Duration(milliseconds: 16),
  }) async {
    final opacities = List<double>.from(state.opacities);
    int index = 0;

    while (index < opacities.length) {
      for (int i = 0; i < lettersPerStep && index < opacities.length; i++) {
        opacities[index] = 1;
        index++;
      }
      emit(AnimationTextState(List<double>.from(opacities)));
      await Future<void>.delayed(stepDuration);
    }
  }
}
