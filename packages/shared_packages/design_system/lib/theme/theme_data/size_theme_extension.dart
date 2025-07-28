
// theme_data/size_theme_extension.dart

// Do not edit directly, this file is auto-generated.

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:design_system/theme/dimensions/size.dart';

class DSSizeThemeExtension extends ThemeExtension<DSSizeThemeExtension> {
  const DSSizeThemeExtension({
    this.sz0 = DSSize.sz0,
    this.sz100 = DSSize.sz100,
    this.sz200 = DSSize.sz200,
    this.sz300 = DSSize.sz300,
    this.sz400 = DSSize.sz400,
    this.sz500 = DSSize.sz500,
    this.sz600 = DSSize.sz600,
    this.sz700 = DSSize.sz700,
    this.sz800 = DSSize.sz800,
    this.sz900 = DSSize.sz900,
    this.sz1000 = DSSize.sz1000,
  });

  final double sz0;
  final double sz100;
  final double sz200;
  final double sz300;
  final double sz400;
  final double sz500;
  final double sz600;
  final double sz700;
  final double sz800;
  final double sz900;
  final double sz1000;

  @override
  DSSizeThemeExtension copyWith({
    double? sz0,
    double? sz100,
    double? sz200,
    double? sz300,
    double? sz400,
    double? sz500,
    double? sz600,
    double? sz700,
    double? sz800,
    double? sz900,
    double? sz1000,
  }) {
    return DSSizeThemeExtension(
      sz0: sz0 ?? this.sz0,
      sz100: sz100 ?? this.sz100,
      sz200: sz200 ?? this.sz200,
      sz300: sz300 ?? this.sz300,
      sz400: sz400 ?? this.sz400,
      sz500: sz500 ?? this.sz500,
      sz600: sz600 ?? this.sz600,
      sz700: sz700 ?? this.sz700,
      sz800: sz800 ?? this.sz800,
      sz900: sz900 ?? this.sz900,
      sz1000: sz1000 ?? this.sz1000,
    );
  }

  @override
  DSSizeThemeExtension lerp(covariant ThemeExtension<DSSizeThemeExtension>? other, double t) {
    if (other is! DSSizeThemeExtension) return this;

    return DSSizeThemeExtension(
      sz0: lerpDouble(sz0, other.sz0, t)!,
      sz100: lerpDouble(sz100, other.sz100, t)!,
      sz200: lerpDouble(sz200, other.sz200, t)!,
      sz300: lerpDouble(sz300, other.sz300, t)!,
      sz400: lerpDouble(sz400, other.sz400, t)!,
      sz500: lerpDouble(sz500, other.sz500, t)!,
      sz600: lerpDouble(sz600, other.sz600, t)!,
      sz700: lerpDouble(sz700, other.sz700, t)!,
      sz800: lerpDouble(sz800, other.sz800, t)!,
      sz900: lerpDouble(sz900, other.sz900, t)!,
      sz1000: lerpDouble(sz1000, other.sz1000, t)!,
    );
  }
}