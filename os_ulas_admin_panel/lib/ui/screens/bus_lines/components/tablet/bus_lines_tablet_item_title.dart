import '../../../../../export.dart';

class BusLinesTabletItemTitle extends StatelessWidget {
  const BusLinesTabletItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.magnolia,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: AppPaddings.largeHorizontal,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: AppPaddings.mediumVertical,
                child: Row(
                  children: [
                    Container(
                      /// TODO: check the padding
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: ColorName.artyClickBlue,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.mediumSize),
                    Text(
                      'Hat ID',
                      style: Theme.of(context).textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: AppPaddings.mediumVertical,
                child: Text(
                  'Hat Adı',
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: AppPaddings.mediumVertical,
                child: Center(
                  child: Text(
                    'Ekleyen Adı',
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: AppPaddings.mediumVertical,
                child: Text(
                  'Details',
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
