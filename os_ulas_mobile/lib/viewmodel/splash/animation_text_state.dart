import 'package:equatable/equatable.dart';

class AnimationTextState extends Equatable {
  final List<double> opacities;

  const AnimationTextState(this.opacities);

  @override
  List<Object?> get props => [opacities];
}
