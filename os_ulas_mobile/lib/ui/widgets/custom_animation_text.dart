import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:os_ulas_mobile/viewmodel/splash/animation_text_cubit.dart';
import 'package:os_ulas_mobile/viewmodel/splash/animation_text_state.dart';

class CustomAnimationText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Duration durationPerLetter;

  const CustomAnimationText({
    super.key,
    required this.text,
    this.style,
    this.durationPerLetter = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = AnimationTextCubit(text);
        cubit.startAnimation(
          lettersPerStep: 2,
          stepDuration: Duration(milliseconds: 96),
        );
        return cubit;
      },
      child: BlocBuilder<AnimationTextCubit, AnimationTextState>(
        builder: (context, state) {
          int opacityIndex = 0;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                text.split('\n').map((line) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        line.split('').map((char) {
                          final opacity = state.opacities[opacityIndex];
                          opacityIndex++;
                          return Opacity(
                            opacity: opacity,
                            child: Text(char, style: style),
                          );
                        }).toList(),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
