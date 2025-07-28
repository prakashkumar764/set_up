import 'package:design_system/src/theme_extensions/models/ds_button_colors.dart';
import 'package:design_system/theme/theme.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';
import 'package:flutter/material.dart';

@immutable
class DSButtonPrimaryThemeExtension extends ThemeExtension<DSButtonPrimaryThemeExtension> {
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

  // Ghost button colors for different states
  final DSButtonColors ghostNormal;
  final DSButtonColors ghostPressed;
  final DSButtonColors ghostDisabled;
  final DSButtonColors ghostLoading;

  const DSButtonPrimaryThemeExtension({
    required this.fillNormal,
    required this.fillPressed,
    required this.fillDisabled,
    required this.fillLoading,
    required this.outlineNormal,
    required this.outlinePressed,
    required this.outlineDisabled,
    required this.outlineLoading,
    required this.ghostNormal,
    required this.ghostPressed,
    required this.ghostDisabled,
    required this.ghostLoading,
  });

  factory DSButtonPrimaryThemeExtension.defaultTheme(DSColorThemeExtension dsColors) {
    return DSButtonPrimaryThemeExtension(
      // Fill button colors
      fillNormal: DSButtonColors(
        background: dsColors.surfacePrimaryDefault,
        textColor: dsColors.textOnSurfaceDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
      ),
      fillPressed: DSButtonColors(
        background: dsColors.surfacePrimaryPress,
        textColor: dsColors.textOnSurfaceDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
      ),
      fillDisabled: DSButtonColors(
        background: dsColors.surfaceNeutralDisabled,
        textColor: dsColors.textNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
        border: dsColors.strokeNeutralDefault,
      ),
      fillLoading: DSButtonColors(
        background: dsColors.surfacePrimaryDefault,
        textColor: dsColors.textOnSurfaceDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
        loadingIconColor: dsColors.strokeNeutralDefault,
      ),

      // Outline button colors
      outlineNormal: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textPrimaryDefault,
        iconColor: dsColors.iconPrimary,
        border: dsColors.strokePrimaryDefault,
      ),
      outlinePressed: DSButtonColors(
        background:
            dsColors
                .surfacePrimaryLightPress,
        textColor: dsColors.textPrimaryDefault,
        iconColor: dsColors.iconPrimary,
        border: dsColors.strokePrimaryDefault,
      ),
      outlineDisabled: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
        border: dsColors.strokeNeutralDisabled,
      ),
      outlineLoading: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textPrimaryDefault,
        iconColor: dsColors.iconPrimary,
        loadingIconColor: dsColors.strokePrimaryDefault,
        border: dsColors.strokePrimaryDefault,
      ),

      // Ghost button colors
      ghostNormal: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textPrimaryDefault,
        iconColor: dsColors.iconPrimary,
      ),
      ghostPressed: DSButtonColors(
        background:
            dsColors
                .surfacePrimaryLightPress,
        textColor: dsColors.textPrimaryDefault,
        iconColor: dsColors.iconPrimary,
      ),
      ghostDisabled: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      ghostLoading: DSButtonColors(
        background: Colors.transparent,
        textColor: dsColors.textPrimaryDefault,
        iconColor: dsColors.iconPrimary,
        loadingIconColor: dsColors.strokePrimaryDefault,
      ),
    );
  }

  @override
  DSButtonPrimaryThemeExtension copyWith({
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
    return DSButtonPrimaryThemeExtension(
      fillNormal: fillNormal ?? this.fillNormal,
      fillPressed: fillPressed ?? this.fillPressed,
      fillDisabled: fillDisabled ?? this.fillDisabled,
      fillLoading: fillLoading ?? this.fillLoading,
      outlineNormal: outlineNormal ?? this.outlineNormal,
      outlinePressed: outlinePressed ?? this.outlinePressed,
      outlineDisabled: outlineDisabled ?? this.outlineDisabled,
      outlineLoading: outlineLoading ?? this.outlineLoading,
      ghostNormal: ghostNormal ?? this.ghostNormal,
      ghostPressed: ghostPressed ?? this.ghostPressed,
      ghostDisabled: ghostDisabled ?? this.ghostDisabled,
      ghostLoading: ghostLoading ?? this.ghostLoading,
    );
  }

  @override
  DSButtonPrimaryThemeExtension lerp(ThemeExtension<DSButtonPrimaryThemeExtension>? other, double t) {
    if (other is! DSButtonPrimaryThemeExtension) {
      return this;
    }

    return DSButtonPrimaryThemeExtension(
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
        border:
            Color.lerp(outlineNormal.border, other.outlineNormal.border, t),
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
        border:
            Color.lerp(outlinePressed.border, other.outlinePressed.border, t),
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
        border:
            Color.lerp(
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
        border:
            Color.lerp(outlineLoading.border, other.outlineLoading.border, t),
      ),
      ghostNormal: DSButtonColors(
        background:
            Color.lerp(
              ghostNormal.background,
              other.ghostNormal.background,
              t,
            )!,
        textColor:
            Color.lerp(ghostNormal.textColor, other.ghostNormal.textColor, t)!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(ghostNormal.border, other.ghostNormal.border, t),
      ),
      ghostPressed: DSButtonColors(
        background:
            Color.lerp(
              ghostPressed.background,
              other.ghostPressed.background,
              t,
            )!,
        textColor:
            Color.lerp(
              ghostPressed.textColor,
              other.ghostPressed.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(ghostPressed.border, other.ghostPressed.border, t),
      ),
      ghostDisabled: DSButtonColors(
        background:
            Color.lerp(
              ghostDisabled.background,
              other.ghostDisabled.background,
              t,
            )!,
        textColor:
            Color.lerp(
              ghostDisabled.textColor,
              other.ghostDisabled.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border:
            Color.lerp(ghostDisabled.border, other.ghostDisabled.border, t),
      ),
      ghostLoading: DSButtonColors(
        background:
            Color.lerp(
              ghostLoading.background,
              other.ghostLoading.background,
              t,
            )!,
        textColor:
            Color.lerp(
              ghostLoading.textColor,
              other.ghostLoading.textColor,
              t,
            )!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(ghostLoading.border, other.ghostLoading.border, t),
      ),
    );
  }
}
