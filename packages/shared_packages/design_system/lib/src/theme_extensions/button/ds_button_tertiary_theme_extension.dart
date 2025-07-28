import 'package:design_system/src/theme_extensions/models/ds_button_tertiary_colors.dart';
import 'package:design_system/theme/theme.dart';
import 'package:flutter/material.dart';

@immutable
class DSButtonTertiaryThemeExtension
    extends ThemeExtension<DSButtonTertiaryThemeExtension> {
  // Fill button colors for different states
  final DSButtonTertiaryColors fillNormal;
  final DSButtonTertiaryColors fillPressed;
  final DSButtonTertiaryColors fillDisabled;
  final DSButtonTertiaryColors fillLoading;

  const DSButtonTertiaryThemeExtension({
    required this.fillNormal,
    required this.fillPressed,
    required this.fillDisabled,
    required this.fillLoading,
  });

  factory DSButtonTertiaryThemeExtension.defaultTheme(
    DSColorThemeExtension dsColors,
  ) {
    final buttonLinearGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 1.0],
      colors: [DSBaseColors.gradientOrange1, DSBaseColors.gradientOrange2],
    );

    return DSButtonTertiaryThemeExtension(
      // Fill button colors
      fillNormal: DSButtonTertiaryColors(
        gradient: buttonLinearGradient,
        textColor: dsColors.textOnSurfaceDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
      ),
      fillPressed: DSButtonTertiaryColors(
        gradient: buttonLinearGradient,
        textColor: dsColors.textOnSurfaceDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
      ),
      fillDisabled: DSButtonTertiaryColors(
        background: dsColors.surfaceNeutralDisabled,
        textColor: dsColors.textNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      fillLoading: DSButtonTertiaryColors(
        gradient: buttonLinearGradient,
        textColor: dsColors.textOnSurfaceDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
        loadingIconColor: dsColors.strokeNeutralDefault,
      ),
    );
  }

  @override
  DSButtonTertiaryThemeExtension copyWith({
    DSButtonTertiaryColors? fillNormal,
    DSButtonTertiaryColors? fillPressed,
    DSButtonTertiaryColors? fillDisabled,
    DSButtonTertiaryColors? fillLoading,
    DSButtonTertiaryColors? outlineNormal,
    DSButtonTertiaryColors? outlinePressed,
    DSButtonTertiaryColors? outlineDisabled,
    DSButtonTertiaryColors? outlineLoading,
    DSButtonTertiaryColors? ghostNormal,
    DSButtonTertiaryColors? ghostPressed,
    DSButtonTertiaryColors? ghostDisabled,
    DSButtonTertiaryColors? ghostLoading,
    Color? fillLoadingIcon,
    Color? outlineLoadingIcon,
    Color? ghostLoadingIcon,
  }) {
    return DSButtonTertiaryThemeExtension(
      fillNormal: fillNormal ?? this.fillNormal,
      fillPressed: fillPressed ?? this.fillPressed,
      fillDisabled: fillDisabled ?? this.fillDisabled,
      fillLoading: fillLoading ?? this.fillLoading,
    );
  }

  @override
  DSButtonTertiaryThemeExtension lerp(
    ThemeExtension<DSButtonTertiaryThemeExtension>? other,
    double t,
  ) {
    if (other is! DSButtonTertiaryThemeExtension) {
      return this;
    }

    return DSButtonTertiaryThemeExtension(
      fillNormal: DSButtonTertiaryColors(
        background:
            Color.lerp(fillNormal.background, other.fillNormal.background, t)!,
        textColor:
            Color.lerp(fillNormal.textColor, other.fillNormal.textColor, t)!,
        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
      ),
      fillPressed: DSButtonTertiaryColors(
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
      ),
      fillDisabled: DSButtonTertiaryColors(
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
      ),
      fillLoading: DSButtonTertiaryColors(
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
      ),
    );
  }
}
