
// theme_data/radius_theme_extension.dart

// Do not edit directly, this file is auto-generated.

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:design_system/theme/dimensions/radius.dart';

class DSRadiusThemeExtension extends ThemeExtension<DSRadiusThemeExtension> {
  const DSRadiusThemeExtension({
    this.rd0 = DSRadius.rd0,
    this.rd100 = DSRadius.rd100,
    this.rd200 = DSRadius.rd200,
    this.rd300 = DSRadius.rd300,
    this.rd400 = DSRadius.rd400,
    this.rd500 = DSRadius.rd500,
    this.rd600 = DSRadius.rd600,
    this.rd700 = DSRadius.rd700,
    this.rd800 = DSRadius.rd800,
    this.rd900 = DSRadius.rd900,
    this.rd1000 = DSRadius.rd1000,
  });

  final double rd0;
  final double rd100;
  final double rd200;
  final double rd300;
  final double rd400;
  final double rd500;
  final double rd600;
  final double rd700;
  final double rd800;
  final double rd900;
  final double rd1000;

  @override
  DSRadiusThemeExtension copyWith({
    double? rd0,
    double? rd100,
    double? rd200,
    double? rd300,
    double? rd400,
    double? rd500,
    double? rd600,
    double? rd700,
    double? rd800,
    double? rd900,
    double? rd1000,
  }) {
    return DSRadiusThemeExtension(
      rd0: rd0 ?? this.rd0,
      rd100: rd100 ?? this.rd100,
      rd200: rd200 ?? this.rd200,
      rd300: rd300 ?? this.rd300,
      rd400: rd400 ?? this.rd400,
      rd500: rd500 ?? this.rd500,
      rd600: rd600 ?? this.rd600,
      rd700: rd700 ?? this.rd700,
      rd800: rd800 ?? this.rd800,
      rd900: rd900 ?? this.rd900,
      rd1000: rd1000 ?? this.rd1000,
    );
  }

  @override
  DSRadiusThemeExtension lerp(covariant ThemeExtension<DSRadiusThemeExtension>? other, double t) {
    if (other is! DSRadiusThemeExtension) return this;

    return DSRadiusThemeExtension(
      rd0: lerpDouble(rd0, other.rd0, t)!,
      rd100: lerpDouble(rd100, other.rd100, t)!,
      rd200: lerpDouble(rd200, other.rd200, t)!,
      rd300: lerpDouble(rd300, other.rd300, t)!,
      rd400: lerpDouble(rd400, other.rd400, t)!,
      rd500: lerpDouble(rd500, other.rd500, t)!,
      rd600: lerpDouble(rd600, other.rd600, t)!,
      rd700: lerpDouble(rd700, other.rd700, t)!,
      rd800: lerpDouble(rd800, other.rd800, t)!,
      rd900: lerpDouble(rd900, other.rd900, t)!,
      rd1000: lerpDouble(rd1000, other.rd1000, t)!,
    );
  }
}