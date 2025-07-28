

import 'package:flutter/material.dart';

class DSButtonTertiaryColors {
  final Gradient? gradient;
  final Color? background;
  final Color textColor;
  final Color iconColor;
  final Color? loadingIconColor;

  const DSButtonTertiaryColors({
    required this.textColor,
    required this.iconColor,
    this.gradient,
    this.background,
    this.loadingIconColor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DSButtonTertiaryColors &&
          runtimeType == other.runtimeType &&
          gradient == other.gradient &&
          background == other.background &&
          textColor == other.textColor &&
          iconColor == other.iconColor &&
          loadingIconColor == other.loadingIconColor;


  @override
  int get hashCode =>
      gradient.hashCode ^
      background.hashCode ^
      textColor.hashCode ^
      iconColor.hashCode ^
      loadingIconColor.hashCode;
}
