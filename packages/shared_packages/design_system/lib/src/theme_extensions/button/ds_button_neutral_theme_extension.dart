import 'package:design_system/src/theme_extensions/models/ds_button_colors.dart';
import 'package:design_system/theme/theme.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';
import 'package:flutter/material.dart';

@immutable
class DSButtonNeutralThemeExtension
    extends ThemeExtension<DSButtonNeutralThemeExtension> {
  // Fill button colors for different states
  final DSButtonColors fillNormal;
  final DSButtonColors fillPressed;
  final DSButtonColors fillDisabled;
  final DSButtonColors fillLoading;

  // Outline button colors for different states
  final DSButtonColors outlineNormal;
  final DSButtonColors outlinePressed;
  final DSButtonColors outlineDisabled;
  final DSButtonColors outlineLoading;

  const DSButtonNeutralThemeExtension({
    required this.fillNormal,
    required this.fillPressed,
    required this.fillDisabled,
    required this.fillLoading,
    required this.outlineNormal,
    required this.outlinePressed,
    required this.outlineDisabled,
    required this.outlineLoading,
  });

  factory DSButtonNeutralThemeExtension.defaultTheme(
    DSColorThemeExtension dsColors,
  ) {
    return DSButtonNeutralThemeExtension(
      // Fill button colors
      fillNormal: DSButtonColors(
        background: dsColors.surfaceNeutralContainerWhite,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDefault,
      ),
      fillPressed: DSButtonColors(
        background: dsColors.surfaceNeutralOpacityPressed,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDefault,
      ),
      fillDisabled: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDisabled,
        border: dsColors.strokeNeutralDefault,
      ),
      fillLoading: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDefault,
        loadingIconColor: dsColors.iconNeutral,
      ),

      // Outline button colors
      outlineNormal: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDefault,
        border: dsColors.strokeNeutralDefault,
      ),
      outlinePressed: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDefault,
        border: dsColors.strokeNeutralDefault,
      ),
      outlineDisabled: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDisabled,
        border: dsColors.strokeNeutralDefault,
      ),
      outlineLoading: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralOnWhite,
        iconColor: dsColors.iconNeutralDefault,
        border: dsColors.strokeBrandDefault,
        loadingIconColor: dsColors.iconNeutral,
      ),
    );
  }

  @override
  DSButtonNeutralThemeExtension copyWith({
    DSButtonColors? fillNormal,
    DSButtonColors? fillPressed,
    DSButtonColors? fillDisabled,
    DSButtonColors? fillLoading,
    DSButtonColors? outlineNormal,
    DSButtonColors? outlinePressed,
    DSButtonColors? outlineDisabled,
    DSButtonColors? outlineLoading,
    DSButtonColors? ghostNormal,
    DSButtonColors? ghostPressed,
    DSButtonColors? ghostDisabled,
    DSButtonColors? ghostLoading,
    Color? fillLoadingIcon,
    Color? outlineLoadingIcon,
    Color? ghostLoadingIcon,
  }) {
    return DSButtonNeutralThemeExtension(
      fillNormal: fillNormal ?? this.fillNormal,
      fillPressed: fillPressed ?? this.fillPressed,
      fillDisabled: fillDisabled ?? this.fillDisabled,
      fillLoading: fillLoading ?? this.fillLoading,
      outlineNormal: outlineNormal ?? this.outlineNormal,
      outlinePressed: outlinePressed ?? this.outlinePressed,
      outlineDisabled: outlineDisabled ?? this.outlineDisabled,
      outlineLoading: outlineLoading ?? this.outlineLoading,
    );
  }

  @override
  DSButtonNeutralThemeExtension lerp(
    ThemeExtension<DSButtonNeutralThemeExtension>? other,
    double t,
  ) {
    if (other is! DSButtonNeutralThemeExtension) {
      return this;
    }

    return DSButtonNeutralThemeExtension(
      fillNormal: DSButtonColors(
        background:
            Color.lerp(fillNormal.background, other.fillNormal.background, t)!,
        textColor:
            Color.lerp(fillNormal.textColor, other.fillNormal.textColor, t)!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(fillNormal.border, other.fillNormal.border, t),
      ),
      fillPressed: DSButtonColors(
        background:
            Color.lerp(
              fillPressed.background,
              other.fillPressed.background,
              t,
            )!,
        textColor:
            Color.lerp(fillPressed.textColor, other.fillPressed.textColor, t)!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(fillPressed.border, other.fillPressed.border, t),
      ),
      fillDisabled: DSButtonColors(
        background:
            Color.lerp(
              fillDisabled.background,
              other.fillDisabled.background,
              t,
            )!,
        textColor:
            Color.lerp(
              fillDisabled.textColor,
              other.fillDisabled.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(fillDisabled.border, other.fillDisabled.border, t),
      ),
      fillLoading: DSButtonColors(
        background:
            Color.lerp(
              fillLoading.background,
              other.fillLoading.background,
              t,
            )!,
        textColor:
            Color.lerp(fillLoading.textColor, other.fillLoading.textColor, t)!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(fillLoading.border, other.fillLoading.border, t),
      ),
      outlineNormal: DSButtonColors(
        background:
            Color.lerp(
              outlineNormal.background,
              other.outlineNormal.background,
              t,
            )!,
        textColor:
            Color.lerp(
              outlineNormal.textColor,
              other.outlineNormal.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(outlineNormal.border, other.outlineNormal.border, t),
      ),
      outlinePressed: DSButtonColors(
        background:
            Color.lerp(
              outlinePressed.background,
              other.outlinePressed.background,
              t,
            )!,
        textColor:
            Color.lerp(
              outlinePressed.textColor,
              other.outlinePressed.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(
          outlinePressed.border,
          other.outlinePressed.border,
          t,
        ),
      ),
      outlineDisabled: DSButtonColors(
        background:
            Color.lerp(
              outlineDisabled.background,
              other.outlineDisabled.background,
              t,
            )!,
        textColor:
            Color.lerp(
              outlineDisabled.textColor,
              other.outlineDisabled.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(
          outlineDisabled.border,
          other.outlineDisabled.border,
          t,
        ),
      ),
      outlineLoading: DSButtonColors(
        background:
            Color.lerp(
              outlineLoading.background,
              other.outlineLoading.background,
              t,
            )!,
        textColor:
            Color.lerp(
              outlineLoading.textColor,
              other.outlineLoading.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(
          outlineLoading.border,
          other.outlineLoading.border,
          t,
        ),
      ),
    );
  }
}
