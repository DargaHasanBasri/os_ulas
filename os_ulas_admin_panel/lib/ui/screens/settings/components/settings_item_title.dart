import '../../../../export.dart';

class SettingsItemTitle extends StatelessWidget {
  const SettingsItemTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.smallAll,
      decoration: BoxDecoration(
        color: ColorName.magnolia,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
