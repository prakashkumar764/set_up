import 'package:design_system/src/theme_extensions/button/ds_button_neutral_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class ButtonNeutralUtils {
  ButtonNeutralUtils._();

  static final ButtonNeutralUtils _instance = ButtonNeutralUtils._();

  factory ButtonNeutralUtils() => _instance;

  BoxDecoration getDecoration({
    required DSButtonNeutralType type,
    required DSButtonState state,
    required DSButtonNeutralThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonNeutralType.fill:
        return BoxDecoration(
          color: _getFillColor(state: state, buttonTheme: buttonTheme),
          borderRadius: BorderRadius.circular(DSRadius.rd200),
        );
      case DSButtonNeutralType.outline:
        return BoxDecoration(
          color: _getOutlineBackgroundColor(
            state: state,
            buttonTheme: buttonTheme,
          ),
          borderRadius: BorderRadius.circular(DSRadius.rd200),
          border: Border.all(
            color: _getOutlineBorderColor(buttonTheme: buttonTheme),
            width: 1,
          ),
        );
    }
  }

  Color _getFillColor({
    required DSButtonState state,
    required DSButtonNeutralThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
        return buttonTheme.fillNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.fillPressed.background;
      case DSButtonState.disabled:
        return buttonTheme.fillDisabled.background;
      case DSButtonState.loading:
        return buttonTheme.fillLoading.background;
    }
  }

  Color _getOutlineBackgroundColor({
    required DSButtonState state,
    required DSButtonNeutralThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
        return buttonTheme.outlineNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.outlinePressed.background;
      case DSButtonState.disabled:
        return buttonTheme.outlineDisabled.background;
      case DSButtonState.loading:
        return buttonTheme.outlineLoading.background;
    }
  }

  Color _getOutlineBorderColor({
    required DSButtonNeutralThemeExtension buttonTheme,
  }) {
    return buttonTheme.outlineNormal.border ??
        DSSemanticColors.strokeNeutralDefault;
  }

  Color getTextColor({required DSButtonNeutralThemeExtension buttonTheme}) {
    return buttonTheme.fillNormal.textColor;
  }

  Color getIconColor({
    required DSButtonState state,
    required DSButtonNeutralThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.fillDisabled.iconColor;
    } else {
      return buttonTheme.fillNormal.iconColor;
    }
  }

  Color getLoadingIconColor({
    required DSButtonNeutralThemeExtension buttonTheme,
  }) {
    return buttonTheme.fillLoading.loadingIconColor ??
        DSSemanticColors.iconNeutral;
  }
}
