import '../../../export.dart';
import '../../../viewmodel/users/check_box_cubit.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    this.borderColor = ColorName.artyClickBlue,
    this.borderRadius = 4,
    this.onTapTick,
  });

  final Color? borderColor;
  final double? borderRadius;
  final void Function(bool isClick)? onTapTick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBoxCubit, bool>(
      builder: (context, isSelected) {
        return Material(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: Colors.transparent,
          child: InkWell(
            onTap: onTapTick != null
                ? () {
                    onTapTick?.call(isSelected);
                    context.read<CheckBoxCubit>().toggle();
                  }
                : null,
            borderRadius: BorderRadius.circular(borderRadius!),
            child: Ink(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor!,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16, color: Colors.green)
                  : null,
            ),
          ),
        );
      },
    );
  }
}
