
// theme_data/spacing_theme_extension.dart

// Do not edit directly, this file is auto-generated.

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:design_system/theme/dimensions/spacing.dart';

class DSSpacingThemeExtension extends ThemeExtension<DSSpacingThemeExtension> {
  const DSSpacingThemeExtension({
    this.sp0 = DSSpacing.sp0,
    this.sp100 = DSSpacing.sp100,
    this.sp200 = DSSpacing.sp200,
    this.sp300 = DSSpacing.sp300,
    this.sp400 = DSSpacing.sp400,
    this.sp500 = DSSpacing.sp500,
    this.sp600 = DSSpacing.sp600,
    this.sp700 = DSSpacing.sp700,
    this.sp800 = DSSpacing.sp800,
    this.sp900 = DSSpacing.sp900,
    this.sp1000 = DSSpacing.sp1000,
  });

  final double sp0;
  final double sp100;
  final double sp200;
  final double sp300;
  final double sp400;
  final double sp500;
  final double sp600;
  final double sp700;
  final double sp800;
  final double sp900;
  final double sp1000;

  @override
  DSSpacingThemeExtension copyWith({
    double? sp0,
    double? sp100,
    double? sp200,
    double? sp300,
    double? sp400,
    double? sp500,
    double? sp600,
    double? sp700,
    double? sp800,
    double? sp900,
    double? sp1000,
  }) {
    return DSSpacingThemeExtension(
      sp0: sp0 ?? this.sp0,
      sp100: sp100 ?? this.sp100,
      sp200: sp200 ?? this.sp200,
      sp300: sp300 ?? this.sp300,
      sp400: sp400 ?? this.sp400,
      sp500: sp500 ?? this.sp500,
      sp600: sp600 ?? this.sp600,
      sp700: sp700 ?? this.sp700,
      sp800: sp800 ?? this.sp800,
      sp900: sp900 ?? this.sp900,
      sp1000: sp1000 ?? this.sp1000,
    );
  }

  @override
  DSSpacingThemeExtension lerp(covariant ThemeExtension<DSSpacingThemeExtension>? other, double t) {
    if (other is! DSSpacingThemeExtension) return this;

    return DSSpacingThemeExtension(
      sp0: lerpDouble(sp0, other.sp0, t)!,
      sp100: lerpDouble(sp100, other.sp100, t)!,
      sp200: lerpDouble(sp200, other.sp200, t)!,
      sp300: lerpDouble(sp300, other.sp300, t)!,
      sp400: lerpDouble(sp400, other.sp400, t)!,
      sp500: lerpDouble(sp500, other.sp500, t)!,
      sp600: lerpDouble(sp600, other.sp600, t)!,
      sp700: lerpDouble(sp700, other.sp700, t)!,
      sp800: lerpDouble(sp800, other.sp800, t)!,
      sp900: lerpDouble(sp900, other.sp900, t)!,
      sp1000: lerpDouble(sp1000, other.sp1000, t)!,
    );
  }
}