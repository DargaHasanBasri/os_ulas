import '../../../../../export.dart';

class BusLinesTabletItem extends StatelessWidget {
  const BusLinesTabletItem({super.key, required this.isDarkBackground});

  final bool isDarkBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkBackground ? ColorName.magnolia : ColorName.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: AppPaddings.largeHorizontal,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: AppPaddings.xSmallVertical,
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
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: AppConstants.exampleID,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('ID kopyalandı!')),
                        );
                      },
                      child: Tooltip(
                        message: AppConstants.exampleID,
                        preferBelow: false,
                        verticalOffset: 12,
                        child: Text(
                          AppConstants.exampleID.shortenId,
                          style: Theme.of(context).textTheme.labelSmall,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
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
                  'A1 Hattı',
                  style: Theme.of(context).textTheme.labelSmall,
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
                    'Hasan Basri Darga',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: AppPaddings.mediumVertical,
                child: CustomButton(
                  title: 'All View',
                  height: 20,
                  borderRadius: 6,
                  onTap: () {},
                  textStyle: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
