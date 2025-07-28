import 'package:design_system/src/theme_extensions/models/ds_button_icon_colors.dart';
import 'package:design_system/theme/theme.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';
import 'package:flutter/material.dart';

@immutable
class DSButtonIconThemeExtension
    extends ThemeExtension<DSButtonIconThemeExtension> {
  // Fill button colors for different states
  final DSButtonIconColors fillNormal;
  final DSButtonIconColors fillPressed;
  final DSButtonIconColors fillDisabled;
  final DSButtonIconColors fillLoading;

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

  // Ghost Neutral button colors for different states
  final DSButtonIconColors ghostNeutralNormal;
  final DSButtonIconColors ghostNeutralPressed;
  final DSButtonIconColors ghostNeutralDisabled;
  final DSButtonIconColors ghostNeutralLoading;

  const DSButtonIconThemeExtension({
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
    required this.ghostNeutralNormal,
    required this.ghostNeutralPressed,
    required this.ghostNeutralDisabled,
    required this.ghostNeutralLoading,
  });

  factory DSButtonIconThemeExtension.defaultTheme(
    DSColorThemeExtension dsColors,
  ) {
    return DSButtonIconThemeExtension(
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

      // Outline button colors
      outlineNormal: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconPrimary,
        border: dsColors.strokePrimaryDefault,
      ),
      outlinePressed: DSButtonIconColors(
        background:
            dsColors
                .surfacePrimaryLightPress,
        iconColor: dsColors.iconPrimary,
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
        iconColor: dsColors.iconPrimary,
      ),
      ghostPressed: DSButtonIconColors(
        background: dsColors.surfacePrimaryLightPress,
        iconColor: dsColors.iconPrimary,
      ),
      ghostDisabled: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      ghostLoading: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconPrimary,
        loadingIconColor: dsColors.iconPrimary,
      ),

      // Ghost Neutral button colors
      ghostNeutralNormal: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutral,
      ),
      ghostNeutralPressed: DSButtonIconColors(
        background:
            dsColors
                .surfaceNeutralOpacityPressed,
        iconColor: dsColors.iconNeutral,
      ),
      ghostNeutralDisabled: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutralDisabled,
      ),
      ghostNeutralLoading: DSButtonIconColors(
        background: Colors.transparent,
        iconColor: dsColors.iconNeutral,
        loadingIconColor: dsColors.iconNeutral,
      ),
    );
  }

  @override
  DSButtonIconThemeExtension copyWith({
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
    DSButtonIconColors? ghostNeutralNormal,
    DSButtonIconColors? ghostNeutralPressed,
    DSButtonIconColors? ghostNeutralDisabled,
    DSButtonIconColors? ghostNeutralLoading,
  }) {
    return DSButtonIconThemeExtension(
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
      ghostNeutralNormal: ghostNeutralNormal ?? this.ghostNeutralNormal,
      ghostNeutralPressed: ghostNeutralNormal ?? this.ghostNeutralPressed,
      ghostNeutralDisabled: ghostNeutralNormal ?? this.ghostNeutralDisabled,
      ghostNeutralLoading: ghostNeutralNormal ?? this.ghostNeutralLoading,
    );
  }

  @override
  DSButtonIconThemeExtension lerp(
    ThemeExtension<DSButtonIconThemeExtension>? other,
    double t,
  ) {
    if (other is! DSButtonIconThemeExtension) {
      return this;
    }

    return DSButtonIconThemeExtension(
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
      ghostNeutralNormal: DSButtonIconColors(
        background:
            Color.lerp(
              ghostNeutralNormal.background,
              other.ghostNeutralNormal.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              ghostNeutralNormal.iconColor,
              other.ghostNeutralNormal.iconColor,
              t,
            )!,
        border: Color.lerp(
          ghostNeutralNormal.border,
          other.ghostNeutralNormal.border,
          t,
        ),
      ),
      ghostNeutralPressed: DSButtonIconColors(
        background:
            Color.lerp(
              ghostNeutralPressed.background,
              other.ghostNeutralPressed.background,
              t,
            )!,
        iconColor:
            Color.lerp(
              ghostNeutralPressed.iconColor,
              other.ghostNeutralPressed.iconColor,
              t,
            )!,
        border: Color.lerp(
          ghostNeutralPressed.border,
          other.ghostNeutralPressed.border,
          t,
        ),
      ),
      ghostNeutralDisabled: DSButtonIconColors(
        background:
            Color.lerp(
              ghostNeutralDisabled.background,
              other.ghostNeutralDisabled.background,
              t,
            )!,
        iconColor:
            Color.lerp(
              ghostNeutralDisabled.iconColor,
              other.ghostNeutralDisabled.iconColor,
              t,
            )!,
        border: Color.lerp(
          ghostNeutralDisabled.border,
          other.ghostNeutralDisabled.border,
          t,
        ),
      ),
      ghostNeutralLoading: DSButtonIconColors(
        background:
            Color.lerp(
              ghostNeutralLoading.background,
              other.ghostNeutralLoading.background,
              t,
            )!,

        iconColor:
            Color.lerp(
              ghostNeutralLoading.iconColor,
              other.ghostNeutralLoading.iconColor,
              t,
            )!,
        border: Color.lerp(
          ghostNeutralLoading.border,
          other.ghostNeutralLoading.border,
          t,
        ),
      ),
    );
  }
}
