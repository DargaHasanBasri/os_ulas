import 'package:flutter/material.dart';

class CustomScreenTitle extends StatelessWidget {
  const CustomScreenTitle({
    super.key,
    required this.title,
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? Theme.of(context).textTheme.bodyLarge,
    );
  }
}
