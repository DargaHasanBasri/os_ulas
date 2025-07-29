import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class BusStopsInfoLabel extends StatelessWidget {
  const BusStopsInfoLabel({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleTextStyle,
    this.subTitleTextStyle,
  });

  final String title;
  final String subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              titleTextStyle ??
              Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style:
              subTitleTextStyle ??
              Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ColorName.rosa,
                fontWeight: FontWeight.w400,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
