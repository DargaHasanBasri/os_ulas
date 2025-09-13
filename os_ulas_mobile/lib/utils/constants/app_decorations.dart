import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class AppDecorations {
  AppDecorations._();

  static BoxDecoration gradientShadowDecoration({
    double borderRadius = 40,
    double borderWidth = 1,
    Color borderColor = ColorName.white,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xffF0A58E),
          Color(0xff613EEA),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          offset: const Offset(0, 4),
          blurRadius: 5,
        ),
      ],
    );
  }

  static BoxDecoration defaultDecoration({
    Color backgroundColor = ColorName.white,
    double borderRadius = 40,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      border: Border.all(
        color: Colors.transparent,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration borderGradientDecoration({
    double borderRadius = 40,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xff613EEA),
          Color(0xffF0A58E),
        ],
      ),
    );
  }
}
