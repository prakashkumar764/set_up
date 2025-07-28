
//
// theme_data/text_theme_extension.dart
//

// Do not edit directly, this file is auto-generated.

import 'package:flutter/material.dart';
import 'package:design_system/theme/typography/text_styles.dart';

class DSTextThemeExtension extends ThemeExtension<DSTextThemeExtension> {
  const DSTextThemeExtension({
    this.primaryHeadingXxl = DSTextStyles.primaryHeadingXxl,
    this.primaryHeadingXl = DSTextStyles.primaryHeadingXl,
    this.primaryHeadingL = DSTextStyles.primaryHeadingL,
    this.primaryHeadingM = DSTextStyles.primaryHeadingM,
    this.primaryHeadingS = DSTextStyles.primaryHeadingS,
    this.primarySubheadingM = DSTextStyles.primarySubheadingM,
    this.primarySubheadingS = DSTextStyles.primarySubheadingS,
    this.primaryBodyMRegular = DSTextStyles.primaryBodyMRegular,
    this.primaryBodyMMedium = DSTextStyles.primaryBodyMMedium,
    this.primaryBodySRegular = DSTextStyles.primaryBodySRegular,
    this.primaryBodySMedium = DSTextStyles.primaryBodySMedium,
    this.primaryCaptionSRegular = DSTextStyles.primaryCaptionSRegular,
    this.primaryCaptionSMedium = DSTextStyles.primaryCaptionSMedium,
    this.primaryButtonLMedium = DSTextStyles.primaryButtonLMedium,
    this.primaryButtonLRegular = DSTextStyles.primaryButtonLRegular,
    this.primaryButtonSMedium = DSTextStyles.primaryButtonSMedium,
    this.primaryButtonSRegular = DSTextStyles.primaryButtonSRegular,
    this.primaryLinkM = DSTextStyles.primaryLinkM,
    this.primaryLinkS = DSTextStyles.primaryLinkS,
    this.primaryNavigationXs = DSTextStyles.primaryNavigationXs,
    this.secondaryHeadingXl = DSTextStyles.secondaryHeadingXl,
    this.secondaryHeadingL = DSTextStyles.secondaryHeadingL,
    this.secondaryHeadingM = DSTextStyles.secondaryHeadingM,
    this.secondaryHeadingS = DSTextStyles.secondaryHeadingS,
    this.secondaryHeadingXs = DSTextStyles.secondaryHeadingXs,
  });

  final TextStyle primaryHeadingXxl;
  final TextStyle primaryHeadingXl;
  final TextStyle primaryHeadingL;
  final TextStyle primaryHeadingM;
  final TextStyle primaryHeadingS;
  final TextStyle primarySubheadingM;
  final TextStyle primarySubheadingS;
  final TextStyle primaryBodyMRegular;
  final TextStyle primaryBodyMMedium;
  final TextStyle primaryBodySRegular;
  final TextStyle primaryBodySMedium;
  final TextStyle primaryCaptionSRegular;
  final TextStyle primaryCaptionSMedium;
  final TextStyle primaryButtonLMedium;
  final TextStyle primaryButtonLRegular;
  final TextStyle primaryButtonSMedium;
  final TextStyle primaryButtonSRegular;
  final TextStyle primaryLinkM;
  final TextStyle primaryLinkS;
  final TextStyle primaryNavigationXs;
  final TextStyle secondaryHeadingXl;
  final TextStyle secondaryHeadingL;
  final TextStyle secondaryHeadingM;
  final TextStyle secondaryHeadingS;
  final TextStyle secondaryHeadingXs;

  @override
  DSTextThemeExtension copyWith({
    TextStyle? primaryHeadingXxl,
    TextStyle? primaryHeadingXl,
    TextStyle? primaryHeadingL,
    TextStyle? primaryHeadingM,
    TextStyle? primaryHeadingS,
    TextStyle? primarySubheadingM,
    TextStyle? primarySubheadingS,
    TextStyle? primaryBodyMRegular,
    TextStyle? primaryBodyMMedium,
    TextStyle? primaryBodySRegular,
    TextStyle? primaryBodySMedium,
    TextStyle? primaryCaptionSRegular,
    TextStyle? primaryCaptionSMedium,
    TextStyle? primaryButtonLMedium,
    TextStyle? primaryButtonLRegular,
    TextStyle? primaryButtonSMedium,
    TextStyle? primaryButtonSRegular,
    TextStyle? primaryLinkM,
    TextStyle? primaryLinkS,
    TextStyle? primaryNavigationXs,
    TextStyle? secondaryHeadingXl,
    TextStyle? secondaryHeadingL,
    TextStyle? secondaryHeadingM,
    TextStyle? secondaryHeadingS,
    TextStyle? secondaryHeadingXs,
  }) {
    return DSTextThemeExtension(
      primaryHeadingXxl: primaryHeadingXxl ?? this.primaryHeadingXxl,
      primaryHeadingXl: primaryHeadingXl ?? this.primaryHeadingXl,
      primaryHeadingL: primaryHeadingL ?? this.primaryHeadingL,
      primaryHeadingM: primaryHeadingM ?? this.primaryHeadingM,
      primaryHeadingS: primaryHeadingS ?? this.primaryHeadingS,
      primarySubheadingM: primarySubheadingM ?? this.primarySubheadingM,
      primarySubheadingS: primarySubheadingS ?? this.primarySubheadingS,
      primaryBodyMRegular: primaryBodyMRegular ?? this.primaryBodyMRegular,
      primaryBodyMMedium: primaryBodyMMedium ?? this.primaryBodyMMedium,
      primaryBodySRegular: primaryBodySRegular ?? this.primaryBodySRegular,
      primaryBodySMedium: primaryBodySMedium ?? this.primaryBodySMedium,
      primaryCaptionSRegular: primaryCaptionSRegular ?? this.primaryCaptionSRegular,
      primaryCaptionSMedium: primaryCaptionSMedium ?? this.primaryCaptionSMedium,
      primaryButtonLMedium: primaryButtonLMedium ?? this.primaryButtonLMedium,
      primaryButtonLRegular: primaryButtonLRegular ?? this.primaryButtonLRegular,
      primaryButtonSMedium: primaryButtonSMedium ?? this.primaryButtonSMedium,
      primaryButtonSRegular: primaryButtonSRegular ?? this.primaryButtonSRegular,
      primaryLinkM: primaryLinkM ?? this.primaryLinkM,
      primaryLinkS: primaryLinkS ?? this.primaryLinkS,
      primaryNavigationXs: primaryNavigationXs ?? this.primaryNavigationXs,
      secondaryHeadingXl: secondaryHeadingXl ?? this.secondaryHeadingXl,
      secondaryHeadingL: secondaryHeadingL ?? this.secondaryHeadingL,
      secondaryHeadingM: secondaryHeadingM ?? this.secondaryHeadingM,
      secondaryHeadingS: secondaryHeadingS ?? this.secondaryHeadingS,
      secondaryHeadingXs: secondaryHeadingXs ?? this.secondaryHeadingXs,
    );
  }

  @override
  DSTextThemeExtension lerp(covariant ThemeExtension<DSTextThemeExtension>? other, double t) {
    if (other is! DSTextThemeExtension) return this;

    return DSTextThemeExtension(
      primaryHeadingXxl: TextStyle.lerp(primaryHeadingXxl, other.primaryHeadingXxl, t)!,
      primaryHeadingXl: TextStyle.lerp(primaryHeadingXl, other.primaryHeadingXl, t)!,
      primaryHeadingL: TextStyle.lerp(primaryHeadingL, other.primaryHeadingL, t)!,
      primaryHeadingM: TextStyle.lerp(primaryHeadingM, other.primaryHeadingM, t)!,
      primaryHeadingS: TextStyle.lerp(primaryHeadingS, other.primaryHeadingS, t)!,
      primarySubheadingM: TextStyle.lerp(primarySubheadingM, other.primarySubheadingM, t)!,
      primarySubheadingS: TextStyle.lerp(primarySubheadingS, other.primarySubheadingS, t)!,
      primaryBodyMRegular: TextStyle.lerp(primaryBodyMRegular, other.primaryBodyMRegular, t)!,
      primaryBodyMMedium: TextStyle.lerp(primaryBodyMMedium, other.primaryBodyMMedium, t)!,
      primaryBodySRegular: TextStyle.lerp(primaryBodySRegular, other.primaryBodySRegular, t)!,
      primaryBodySMedium: TextStyle.lerp(primaryBodySMedium, other.primaryBodySMedium, t)!,
      primaryCaptionSRegular: TextStyle.lerp(primaryCaptionSRegular, other.primaryCaptionSRegular, t)!,
      primaryCaptionSMedium: TextStyle.lerp(primaryCaptionSMedium, other.primaryCaptionSMedium, t)!,
      primaryButtonLMedium: TextStyle.lerp(primaryButtonLMedium, other.primaryButtonLMedium, t)!,
      primaryButtonLRegular: TextStyle.lerp(primaryButtonLRegular, other.primaryButtonLRegular, t)!,
      primaryButtonSMedium: TextStyle.lerp(primaryButtonSMedium, other.primaryButtonSMedium, t)!,
      primaryButtonSRegular: TextStyle.lerp(primaryButtonSRegular, other.primaryButtonSRegular, t)!,
      primaryLinkM: TextStyle.lerp(primaryLinkM, other.primaryLinkM, t)!,
      primaryLinkS: TextStyle.lerp(primaryLinkS, other.primaryLinkS, t)!,
      primaryNavigationXs: TextStyle.lerp(primaryNavigationXs, other.primaryNavigationXs, t)!,
      secondaryHeadingXl: TextStyle.lerp(secondaryHeadingXl, other.secondaryHeadingXl, t)!,
      secondaryHeadingL: TextStyle.lerp(secondaryHeadingL, other.secondaryHeadingL, t)!,
      secondaryHeadingM: TextStyle.lerp(secondaryHeadingM, other.secondaryHeadingM, t)!,
      secondaryHeadingS: TextStyle.lerp(secondaryHeadingS, other.secondaryHeadingS, t)!,
      secondaryHeadingXs: TextStyle.lerp(secondaryHeadingXs, other.secondaryHeadingXs, t)!,
    );
  }
}


extension DSTextThemeExtensionBuilder on DSTextThemeExtension {

  /// Converts to a basic Material TextTheme.
  /// Note: This is only as a fallback to provide better default styles for Material widgets,
  ///       prefer using the theme extension properties.
  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: primaryHeadingXxl,
      displayMedium: primaryHeadingXl,
      displaySmall: primaryHeadingL,
      headlineLarge: secondaryHeadingM,
      headlineMedium: secondaryHeadingS,
      headlineSmall: secondaryHeadingXs,
      titleLarge: primarySubheadingM,
      titleMedium: primarySubheadingS,
      titleSmall: primarySubheadingS,
      bodyLarge: primaryBodyMMedium,
      bodyMedium: primaryBodyMRegular,
      bodySmall: primaryBodySRegular,
      labelLarge: primaryCaptionSMedium,
      labelMedium: primaryCaptionSRegular,
      labelSmall: primaryCaptionSRegular,
    );
  }
}