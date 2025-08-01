import '../../../../export.dart';

class TitleAndEdit extends StatelessWidget {
  const TitleAndEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomScreenTitle(title: 'My Detail'),
        Padding(
          padding: AppPaddings.mediumHorizontal,
          child: Container(
            padding: AppPaddings.smallAll,
            decoration: BoxDecoration(
              color: ColorName.magnolia,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Assets.icons.icEdit.image(
              package: 'gen',
              color: ColorName.artyClickBlue,
            ),
          ),
        ),
      ],
    );
  }
}
