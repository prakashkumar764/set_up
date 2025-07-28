import 'package:design_system/src/theme_extensions/button/ds_button_icon_circle_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_icon_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_primary_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_secondary_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_neutral_theme_extension.dart';
import 'package:design_system/src/theme_extensions/button/ds_button_tertiary_theme_extension.dart';
import 'package:design_system/src/theme_extensions/ds_text_input_theme_extension.dart';
import 'package:flutter/material.dart';

extension DSThemeBuildContextExtension on BuildContext {
  /// The design system primary button color values in the current theme
  DSButtonPrimaryThemeExtension get dsButtonPrimaryTheme =>
      Theme.of(this).extension<DSButtonPrimaryThemeExtension>()!;

  /// The design system secondary button color values in the current theme
  DSButtonSecondaryThemeExtension get dsButtonSecondaryTheme =>
      Theme.of(this).extension<DSButtonSecondaryThemeExtension>()!;

  /// The design system button tertiary color values in the current theme
  DSButtonTertiaryThemeExtension get dsButtonTertiaryTheme =>
      Theme.of(this).extension<DSButtonTertiaryThemeExtension>()!;

  /// The design system neutral button color values in the current theme
  DSButtonNeutralThemeExtension get dsButtonNeutralTheme =>
      Theme.of(this).extension<DSButtonNeutralThemeExtension>()!;

  /// The design system button icon color values in the current theme
  DSButtonIconThemeExtension get dsButtonIconTheme =>
      Theme.of(this).extension<DSButtonIconThemeExtension>()!;

  /// The design system button icon circle color values in the current theme
  DSButtonIconCircleThemeExtension get dsButtonIconCircleTheme =>
      Theme.of(this).extension<DSButtonIconCircleThemeExtension>()!;

  /// The design system text input color values in the current theme
  DSTextInputThemeExtension get dsTextInputTheme =>
      Theme.of(this).extension<DSTextInputThemeExtension>()!;
}