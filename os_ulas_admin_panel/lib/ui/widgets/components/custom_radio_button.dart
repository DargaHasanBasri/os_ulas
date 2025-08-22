import '../../../export.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.index,
    this.borderColor = ColorName.artyClickBlue,
    this.borderRadius = 20,
    this.onTapTick,
  });

  final int index;
  final Color? borderColor;
  final double? borderRadius;
  final void Function(bool isClick)? onTapTick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonCubit, int?>(
      builder: (context, selectedIndex) {
        final isSelected = selectedIndex == index;
        return Material(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius!),
            onTap: onTapTick != null
                ? () {
                    onTapTick?.call(isSelected);
                    context.read<RadioButtonCubit>().select(index);
                  }
                : null,
            child: Ink(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius!),
                border: Border.all(
                  color: borderColor!,
                ),
              ),
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: borderColor,
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
