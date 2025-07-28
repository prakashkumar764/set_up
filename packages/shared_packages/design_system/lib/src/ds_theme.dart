import 'package:design_system/design_system.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_icon_circle_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_icon_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_neutral_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_primary_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_secondary_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_tertiary_theme_extension.dart';
import 'package:design_system/src/theme_extensions/ds_text_input_theme_extension.dart';

final dsTheme = DSThemeData.create(
  extensions: [
    DSThemeExtensionBuilder(
      builder: (ds) => DSButtonPrimaryThemeExtension.defaultTheme(ds.colors),
    ),
    DSThemeExtensionBuilder(
      builder: (ds) => DSButtonSecondaryThemeExtension.defaultTheme(ds.colors),
    ),
    DSThemeExtensionBuilder(
      builder: (ds) => DSButtonTertiaryThemeExtension.defaultTheme(ds.colors),
    ),
    DSThemeExtensionBuilder(
      builder: (ds) => DSButtonNeutralThemeExtension.defaultTheme(ds.colors),
    ),
    DSThemeExtensionBuilder(
      builder: (ds) => DSButtonIconThemeExtension.defaultTheme(ds.colors),
    ),
    DSThemeExtensionBuilder(
      builder: (ds) => DSButtonIconCircleThemeExtension.defaultTheme(ds.colors),
    ),
    DSThemeExtensionBuilder(
      builder: (ds) => DSTextInputThemeExtension.defaultTheme(ds.colors),
    ),
  ],
);
