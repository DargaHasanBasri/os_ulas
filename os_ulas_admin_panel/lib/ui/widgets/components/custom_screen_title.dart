import 'package:flutter/material.dart';

class CustomScreenTitle extends StatelessWidget {
  const CustomScreenTitle({
    super.key,
    required this.textTitle,
    this.style,
  });

  final String textTitle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: style ?? Theme.of(context).textTheme.bodyLarge,
    );
  }
}
