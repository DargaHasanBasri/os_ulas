import '../../../../../export.dart';

class BusLinesMobileItem extends StatelessWidget {
  const BusLinesMobileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.mediumAll,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    SizedBox(width: 8),
                    Text(
                      'Hat ID: ',
                      style: Theme.of(context).textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '5sdf456g456456ssfg456sdfg456645gf'.shortenId,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ColorName.silverChalice,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hat Adı",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "A1 Hattı",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ColorName.silverChalice,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ekleyen Adı",
                          style: Theme.of(context).textTheme.labelLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "Hasan Basri Darga",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ColorName.silverChalice,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CustomButton(
                  title: 'All View',
                  height: 24,
                  borderRadius: 6,
                  onTap: () {},
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                CustomButton(
                  backgroundColor: ColorName.redRibbon.withValues(alpha: 0.8),
                  title: 'Delete',
                  height: 24,
                  borderRadius: 6,
                  onTap: () {},
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ColorName.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
