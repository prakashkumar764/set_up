
//
// theme_data/theme_data.dart
//

// Do not edit directly, this file is auto-generated.

import 'package:flutter/material.dart';
import 'package:design_system/theme/theme_data/extension_provider.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';
import 'package:design_system/theme/theme_data/text_theme_extension.dart';
import 'package:design_system/theme/theme_data/size_theme_extension.dart';
import 'package:design_system/theme/theme_data/spacing_theme_extension.dart';
import 'package:design_system/theme/theme_data/radius_theme_extension.dart';

class DSThemeData {
  /// Creates a [ThemeData] instance with default or custom theme extensions
  ///
  /// [colorTheme] - Custom color theme extension
  /// [textTheme] - Custom text theme extension
  /// [sizeTheme] - Custom size theme extension
  /// [spacingTheme] - Custom spacing theme extension
  /// [radiusTheme] - Custom radius theme extension
  /// [extensions] - List of custom theme extensions
  ///
  /// Usage:
  ///   final theme = DSThemeData.create(
  ///     extensions: [
  ///       DSThemeExtension(extension: MyWidgetExtension()),
  ///       DSThemeExtensionBuilder(builder: (ds) => MyExtensionThatDependsOnCurrentTheme(dsColors: ds.colors)),
  ///     ],
  /// );
  static ThemeData create({
    Brightness brightness = Brightness.light,
    bool useMaterial3 = true,
    DSColorThemeExtension? colorTheme,
    DSTextThemeExtension? textTheme,
    DSSizeThemeExtension? sizeTheme,
    DSSpacingThemeExtension? spacingTheme,
    DSRadiusThemeExtension? radiusTheme,
    List<DSThemeExtensionProvider>? extensions,
  }) {
    final baseTheme = DSBaseTheme(
      colors: colorTheme ?? DSColorThemeExtension(),
      text: textTheme ?? DSTextThemeExtension(),
      sizes: sizeTheme ?? DSSizeThemeExtension(),
      spacing: spacingTheme ?? DSSpacingThemeExtension(),
      radius: radiusTheme ?? DSRadiusThemeExtension(),
    );

    return ThemeData(
      useMaterial3: useMaterial3,
      brightness: brightness,
      colorScheme: baseTheme.colors.toColorScheme(brightness: brightness),
      extensions: _buildExtensions(baseTheme, extensions),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static List<ThemeExtension<dynamic>> _buildExtensions(
    DSBaseTheme baseTheme,
    List<DSThemeExtensionProvider>? customExtensions,
  ) {
    final extensions = <Object>[
      baseTheme.colors,
      baseTheme.text,
      baseTheme.sizes,
      baseTheme.spacing,
      baseTheme.radius,
    ];

    if (customExtensions != null) {
      extensions.addAll(
        customExtensions.map(
          (e) => switch (e) {
            DSThemeExtension(extension: final extension) => extension,
            DSThemeExtensionBuilder(builder: final builder) => builder(
              baseTheme,
            ),
          },
        ),
      );
    }

    return extensions.cast<ThemeExtension<dynamic>>();
  }

  /// Helper method to get the [ColorThemeExtension] from the current [BuildContext].
  static DSColorThemeExtension colorsOf(BuildContext context) {
    return Theme.of(context).extension<DSColorThemeExtension>()!;
  }

  /// Helper method to get the [TextThemeExtension] from the current [BuildContext].
  static DSTextThemeExtension textStylesOf(BuildContext context) {
    return Theme.of(context).extension<DSTextThemeExtension>()!;
  }

  /// Helper method to get the [SizeThemeExtension] from the current [BuildContext].
  static DSSizeThemeExtension sizesOf(BuildContext context) {
    return Theme.of(context).extension<DSSizeThemeExtension>()!;
  }

  /// Helper method to get the [SpacingThemeExtension] from the current [BuildContext].
  static DSSpacingThemeExtension spacingOf(BuildContext context) {
    return Theme.of(context).extension<DSSpacingThemeExtension>()!;
  }

  /// Helper method to get the [RadiusThemeExtension] from the current [BuildContext].
  static DSRadiusThemeExtension radiusOf(BuildContext context) {
    return Theme.of(context).extension<DSRadiusThemeExtension>()!;
  }

  /// Helper method to get ANY [ThemeExtension] from the current [BuildContext].
  static T extensionOf<T extends ThemeExtension<T>>(BuildContext context) {
    return Theme.of(context).extension<T>()!;
  }
}

extension BuildContextExtensions on BuildContext {
  /// The design system text styles in the current theme
  DSTextThemeExtension get dsText => DSThemeData.textStylesOf(this);

  /// The design system colors in the current theme
  DSColorThemeExtension get dsColors => DSThemeData.colorsOf(this);

  /// The design system sizes values in the current theme
  DSSizeThemeExtension get dsSizes => DSThemeData.sizesOf(this);

  /// The design system spacing values in the current theme
  DSSpacingThemeExtension get dsSpacing => DSThemeData.spacingOf(this);

  /// The design system radius values in the current theme
  DSRadiusThemeExtension get dsRadius => DSThemeData.radiusOf(this);
}
