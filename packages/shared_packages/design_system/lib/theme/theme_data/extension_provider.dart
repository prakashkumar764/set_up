
//
// theme_data/extension_provider.dart
//

// Do not edit directly, this file is auto-generated.

import 'package:flutter/material.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';
import 'package:design_system/theme/theme_data/radius_theme_extension.dart';
import 'package:design_system/theme/theme_data/size_theme_extension.dart';
import 'package:design_system/theme/theme_data/spacing_theme_extension.dart';
import 'package:design_system/theme/theme_data/text_theme_extension.dart';

/// A container for the base design system theme extensions.
class DSBaseTheme {
  final DSColorThemeExtension colors;
  final DSTextThemeExtension text;
  final DSSizeThemeExtension sizes;
  final DSSpacingThemeExtension spacing;
  final DSRadiusThemeExtension radius;

  const DSBaseTheme({
    required this.colors,
    required this.text,
    required this.sizes,
    required this.spacing,
    required this.radius,
  });
}

/// A sealed wrapper to allow passing either a direct ThemeExtension
/// or a ThemeExtensionBuilder in a type-safe way.
sealed class DSThemeExtensionProvider {}

/// Wraps a direct ThemeExtension instance.
class DSThemeExtension extends DSThemeExtensionProvider {
  final ThemeExtension<dynamic> extension;
  DSThemeExtension({required this.extension});
}

/// Wraps a ThemeExtensionBuilder function.
class DSThemeExtensionBuilder extends DSThemeExtensionProvider {
  final DSThemeExtensionBuilderFunction builder;
  DSThemeExtensionBuilder({required this.builder});
}

typedef DSThemeExtensionBuilderFunction =
    ThemeExtension<dynamic> Function(DSBaseTheme baseTheme);
