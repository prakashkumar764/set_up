import 'package:design_system/src/theme_extensions/button/ds_button_tertiary_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class ButtonTertiaryUtils {
  ButtonTertiaryUtils._();

  static final ButtonTertiaryUtils _instance = ButtonTertiaryUtils._();

  factory ButtonTertiaryUtils() => _instance;

  BoxDecoration getDecoration({
    required DSButtonState state,
    required DSButtonTertiaryThemeExtension buttonTheme,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(DSRadius.rd200),
      border: Border.all(color: Colors.transparent),
      color: buttonTheme.fillDisabled.background,
      gradient:
          state == DSButtonState.disabled
              ? null
              : buttonTheme.fillNormal.gradient,
      boxShadow:
          state == DSButtonState.disabled
              ? null
              : [
                BoxShadow(
                  color: DSBaseColors.opacityNeutralOpacity400,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
    );
  }

  Color getTextColor({
    required DSButtonState state,
    required DSButtonTertiaryThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
      case DSButtonState.pressed:
      case DSButtonState.loading:
        return buttonTheme.fillNormal.textColor;
      case DSButtonState.disabled:
        return buttonTheme.fillDisabled.textColor;
    }
  }

  Color getIconColor({
    required DSButtonState state,
    required DSButtonTertiaryThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.fillDisabled.iconColor;
    } else {
      return buttonTheme.fillNormal.iconColor;
    }
  }
}
