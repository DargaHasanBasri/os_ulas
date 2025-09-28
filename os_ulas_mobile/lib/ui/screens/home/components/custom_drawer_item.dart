import '../export.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Image icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap,
        child: Ink(
          padding: AppPaddings.largeHorizontal+ AppPaddings.mediumVertical,
          color: Colors.transparent,
          child: Row(
            spacing: 24,
            children: [
              icon,
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
