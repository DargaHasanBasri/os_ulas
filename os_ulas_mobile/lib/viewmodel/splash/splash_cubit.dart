import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_mobile/viewmodel/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState(0));

  Future<void> startAnimation() async {
    for (double i = 0; i <= 2 * pi; i += 0.1) {
      await Future<void>.delayed(const Duration(milliseconds: 16));
      emit(SplashState(i));
    }
  }
}
