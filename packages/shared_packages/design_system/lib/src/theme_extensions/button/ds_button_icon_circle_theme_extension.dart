import 'package:design_system/src/theme_extensions/models/ds_button_icon_colors.dart';
import 'package:design_system/theme/theme.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';
import 'package:flutter/material.dart';

@immutable
class DSButtonIconCircleThemeExtension
    extends ThemeExtension<DSButtonIconCircleThemeExtension> {
  // Fill button colors for different states
  final DSButtonIconColors fillNormal;
  final DSButtonIconColors fillPressed;
  final DSButtonIconColors fillDisabled;
  final DSButtonIconColors fillLoading;

  // Fill Neutral button colors for different states
  final DSButtonIconColors fillNeutralNormal;
  final DSButtonIconColors fillNeutralPressed;
  final DSButtonIconColors fillNeutralDisabled;
  final DSButtonIconColors fillNeutralLoading;

  // Outline button colors for different states
  final DSButtonIconColors outlineNormal;
  final DSButtonIconColors outlinePressed;
  final DSButtonIconColors outlineDisabled;
  final DSButtonIconColors outlineLoading;

  // Ghost button colors for different states
  final DSButtonIconColors ghostNormal;
  final DSButtonIconColors ghostPressed;
  final DSButtonIconColors ghostDisabled;
  final DSButtonIconColors ghostLoading;

  const DSButtonIconCircleThemeExtension({
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
    required this.fillNeutralNormal,
    required this.fillNeutralPressed,
    required this.fillNeutralDisabled,
    required this.fillNeutralLoading,
  });

  factory DSButtonIconCircleThemeExtension.defaultTheme(
    DSColorThemeExtension dsColors,
  ) {
    return DSButtonIconCircleThemeExtension(
      // Fill button colors
      fillNormal: DSButtonIconColors(
        background: dsColors.surfacePrimaryDefault,
        iconColor: dsColors.iconOnSurfaceDefault,
      ),
      fillPressed: DSButtonIconColors(
        background: dsColors.surfacePrimaryPress,
        iconColor: dsColors.iconOnSurfaceDefault,
      ),
      fillDisabled: DSButtonIconColors(
        background: dsColors.surfaceNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      fillLoading: DSButtonIconColors(
        background: dsColors.surfacePrimaryDefault,
        iconColor: dsColors.strokeNeutralDefault,
        loadingIconColor: dsColors.strokeNeutralDefault,
      ),

      // Fill Neutral button colors
      fillNeutralNormal: DSButtonIconColors(
        background: dsColors.surfaceNeutralContainerWhite,
        iconColor: dsColors.iconPrimary,
      ),
      fillNeutralPressed: DSButtonIconColors(
        background: dsColors.surfaceNeutralPress,
        iconColor: dsColors.iconPrimary,
      ),
      fillNeutralDisabled: DSButtonIconColors(
        background: dsColors.surfaceNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      fillNeutralLoading: DSButtonIconColors(
        background: dsColors.surfaceNeutralContainerWhite,
        iconColor: dsColors.iconNeutral,
        loadingIconColor: dsColors.iconNeutral,
      ),

      // Outline button colors
      outlineNormal: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconPrimary,
        border: dsColors.strokePrimaryDefault,
      ),
      outlinePressed: DSButtonIconColors(
        background: dsColors.surfacePrimaryLightPress,
        iconColor: dsColors.iconPrimary,
        border: dsColors.strokePrimaryDefault,
      ),
      outlineDisabled: DSButtonIconColors(
        background: dsColors.surfaceNeutralDisabled,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      outlineLoading: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconPrimary,
        border: dsColors.strokePrimaryDefault,
        loadingIconColor: dsColors.iconPrimary,
      ),

      // Ghost button colors
      ghostNormal: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutral,
      ),
      ghostPressed: DSButtonIconColors(
        background: dsColors.surfaceNeutralOpacityPressed,
        iconColor: dsColors.iconNeutral,
      ),
      ghostDisabled: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      ghostLoading: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutral,
        loadingIconColor: dsColors.iconNeutral,
      ),
    );
  }

  @override
  DSButtonIconCircleThemeExtension copyWith({
    DSButtonIconColors? fillNormal,
    DSButtonIconColors? fillPressed,
    DSButtonIconColors? fillDisabled,
    DSButtonIconColors? fillLoading,
    DSButtonIconColors? outlineNormal,
    DSButtonIconColors? outlinePressed,
    DSButtonIconColors? outlineDisabled,
    DSButtonIconColors? outlineLoading,
    DSButtonIconColors? ghostNormal,
    DSButtonIconColors? ghostPressed,
    DSButtonIconColors? ghostDisabled,
    DSButtonIconColors? ghostLoading,
    DSButtonIconColors? fillNeutralNormal,
    DSButtonIconColors? fillNeutralPressed,
    DSButtonIconColors? fillNeutralDisabled,
    DSButtonIconColors? fillNeutralLoading,
  }) {
    return DSButtonIconCircleThemeExtension(
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
      fillNeutralNormal: fillNeutralNormal ?? this.fillNeutralNormal,
      fillNeutralPressed: fillNeutralNormal ?? this.fillNeutralPressed,
      fillNeutralDisabled: fillNeutralNormal ?? this.fillNeutralDisabled,
      fillNeutralLoading: fillNeutralNormal ?? this.fillNeutralLoading,
    );
  }

  @override
  DSButtonIconCircleThemeExtension lerp(
    ThemeExtension<DSButtonIconCircleThemeExtension>? other,
    double t,
  ) {
    if (other is! DSButtonIconCircleThemeExtension) {
      return this;
    }

    return DSButtonIconCircleThemeExtension(
      fillNormal: DSButtonIconColors(
        background:
            Color.lerp(fillNormal.background, other.fillNormal.background, t)!,

        iconColor:
            Color.lerp(fillNormal.iconColor, other.fillNormal.iconColor, t)!,
        border: Color.lerp(fillNormal.border, other.fillNormal.border, t),
      ),
      fillPressed: DSButtonIconColors(
        background:
            Color.lerp(
              fillPressed.background,
              other.fillPressed.background,
              t,
            )!,
        iconColor:
            Color.lerp(fillPressed.iconColor, other.fillPressed.iconColor, t)!,
        border: Color.lerp(fillPressed.border, other.fillPressed.border, t),
      ),
      fillDisabled: DSButtonIconColors(
        background:
            Color.lerp(
              fillDisabled.background,
              other.fillDisabled.background,
              t,
            )!,
        iconColor:
            Color.lerp(
              fillDisabled.iconColor,
              other.fillDisabled.iconColor,
              t,
            )!,
        border: Color.lerp(fillDisabled.border, other.fillDisabled.border, t),
      ),
      fillLoading: DSButtonIconColors(
        background:
            Color.lerp(
              fillLoading.background,
              other.fillLoading.background,
              t,
            )!,

        iconColor:
            Color.lerp(fillLoading.iconColor, other.fillLoading.iconColor, t)!,
        border: Color.lerp(fillLoading.border, other.fillLoading.border, t),
      ),
      outlineNormal: DSButtonIconColors(
        background:
            Color.lerp(
              outlineNormal.background,
              other.outlineNormal.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              outlineNormal.iconColor,
              other.outlineNormal.iconColor,
              t,
            )!,
        border: Color.lerp(outlineNormal.border, other.outlineNormal.border, t),
      ),
      outlinePressed: DSButtonIconColors(
        background:
            Color.lerp(
              outlinePressed.background,
              other.outlinePressed.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              outlinePressed.iconColor,
              other.outlinePressed.iconColor,
              t,
            )!,
        border: Color.lerp(
          outlinePressed.border,
          other.outlinePressed.border,
          t,
        ),
      ),
      outlineDisabled: DSButtonIconColors(
        background:
            Color.lerp(
              outlineDisabled.background,
              other.outlineDisabled.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              outlineDisabled.iconColor,
              other.outlineDisabled.iconColor,
              t,
            )!,
        border: Color.lerp(
          outlineDisabled.border,
          other.outlineDisabled.border,
          t,
        ),
      ),
      outlineLoading: DSButtonIconColors(
        background:
            Color.lerp(
              outlineLoading.background,
              other.outlineLoading.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              outlineLoading.iconColor,
              other.outlineLoading.iconColor,
              t,
            )!,
        border: Color.lerp(
          outlineLoading.border,
          other.outlineLoading.border,
          t,
        ),
      ),
      ghostNormal: DSButtonIconColors(
        background:
            Color.lerp(
              ghostNormal.background,
              other.ghostNormal.background,
              t,
            )!,

        iconColor:
            Color.lerp(ghostNormal.iconColor, other.ghostNormal.iconColor, t)!,
        border: Color.lerp(ghostNormal.border, other.ghostNormal.border, t),
      ),
      ghostPressed: DSButtonIconColors(
        background:
            Color.lerp(
              ghostPressed.background,
              other.ghostPressed.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              ghostPressed.iconColor,
              other.ghostPressed.iconColor,
              t,
            )!,
        border: Color.lerp(ghostPressed.border, other.ghostPressed.border, t),
      ),
      ghostDisabled: DSButtonIconColors(
        background:
            Color.lerp(
              ghostDisabled.background,
              other.ghostDisabled.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              ghostDisabled.iconColor,
              other.ghostDisabled.iconColor,
              t,
            )!,
        border: Color.lerp(ghostDisabled.border, other.ghostDisabled.border, t),
      ),
      ghostLoading: DSButtonIconColors(
        background:
            Color.lerp(
              ghostLoading.background,
              other.ghostLoading.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              ghostLoading.iconColor,
              other.ghostLoading.iconColor,
              t,
            )!,
        border: Color.lerp(ghostLoading.border, other.ghostLoading.border, t),
      ),
      fillNeutralNormal: DSButtonIconColors(
        background:
            Color.lerp(
              fillNeutralNormal.background,
              other.fillNeutralNormal.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              fillNeutralNormal.iconColor,
              other.fillNeutralNormal.iconColor,
              t,
            )!,
        border: Color.lerp(
          fillNeutralNormal.border,
          other.fillNeutralNormal.border,
          t,
        ),
      ),
      fillNeutralPressed: DSButtonIconColors(
        background:
            Color.lerp(
              fillNeutralPressed.background,
              other.fillNeutralPressed.background,
              t,
            )!,
        iconColor:
            Color.lerp(
              fillNeutralPressed.iconColor,
              other.fillNeutralPressed.iconColor,
              t,
            )!,
        border: Color.lerp(
          fillNeutralPressed.border,
          other.fillNeutralPressed.border,
          t,
        ),
      ),
      fillNeutralDisabled: DSButtonIconColors(
        background:
            Color.lerp(
              fillNeutralDisabled.background,
              other.fillNeutralDisabled.background,
              t,
            )!,
        iconColor:
            Color.lerp(
              fillNeutralDisabled.iconColor,
              other.fillNeutralDisabled.iconColor,
              t,
            )!,
        border: Color.lerp(
          fillNeutralDisabled.border,
          other.fillNeutralDisabled.border,
          t,
        ),
      ),
      fillNeutralLoading: DSButtonIconColors(
        background:
            Color.lerp(
              fillNeutralLoading.background,
              other.fillNeutralLoading.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              fillNeutralLoading.iconColor,
              other.fillNeutralLoading.iconColor,
              t,
            )!,
        border: Color.lerp(
          fillNeutralLoading.border,
          other.fillNeutralLoading.border,
          t,
        ),
      ),
    );
  }
}
