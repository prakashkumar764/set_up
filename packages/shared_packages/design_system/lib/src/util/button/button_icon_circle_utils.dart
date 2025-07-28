import 'package:design_system/src/theme_extensions/button/ds_button_icon_circle_theme_extension.dart';
import 'package:design_system/src/ui/models/button/button_icon/button_icon_circle/ds_button_icon_circle_type.dart';
import 'package:design_system/src/ui/models/button/ds_button_state.dart';
import 'package:design_system/theme/colors/semantic_colors.dart';
import 'package:flutter/material.dart';

class ButtonIconCircleUtils {
  ButtonIconCircleUtils._();

  static final ButtonIconCircleUtils _instance = ButtonIconCircleUtils._();

  factory ButtonIconCircleUtils() => _instance;

  Color getBackgroundColor({
    required DSButtonState state,
    required DSButtonIconCircleType type,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonIconCircleType.fill:
        return _getFillColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconCircleType.fillNeutral:
        return _getFillNeutralColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconCircleType.outline:
        return _getOutlineBackgroundColor(
          state: state,
          buttonTheme: buttonTheme,
        );
      case DSButtonIconCircleType.ghost:
        return _getGhostBackgroundColor(state: state, buttonTheme: buttonTheme);
    }
  }

  Color _getFillColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
      case DSButtonState.loading:
        return buttonTheme.fillNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.fillPressed.background;
      case DSButtonState.disabled:
        return buttonTheme.fillDisabled.background;
    }
  }

  Color _getFillNeutralColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
      case DSButtonState.loading:
        return buttonTheme.fillNeutralNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.fillNeutralPressed.background;
      case DSButtonState.disabled:
        return buttonTheme.fillNeutralDisabled.background;
    }
  }

  Color _getOutlineBackgroundColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
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

  Color _getGhostBackgroundColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
      case DSButtonState.disabled:
      case DSButtonState.loading:
        return buttonTheme.ghostNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.ghostPressed.background;
    }
  }

  Color getBorderColor({
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    return buttonTheme.outlineNormal.border ??
        DSSemanticColors.strokePrimaryDefault;
  }

  Color getIconColor({
    required DSButtonState state,
    required DSButtonIconCircleType type,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonIconCircleType.fill:
        return _getFillIconColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconCircleType.fillNeutral:
        return _getFillNeutralIconColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconCircleType.outline:
        return _getOutlineIconColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconCircleType.ghost:
        return _getGhostIconColor(state: state, buttonTheme: buttonTheme);
    }
  }

  Color _getFillIconColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.loading) {
      return buttonTheme.fillLoading.iconColor;
    } else if (state == DSButtonState.disabled) {
      return buttonTheme.fillDisabled.iconColor;
    } else {
      return buttonTheme.fillNormal.iconColor;
    }
  }

  Color _getFillNeutralIconColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.loading) {
      return buttonTheme.fillNeutralLoading.iconColor;
    } else if (state == DSButtonState.disabled) {
      return buttonTheme.fillNeutralDisabled.iconColor;
    } else {
      return buttonTheme.fillNeutralNormal.iconColor;
    }
  }

  Color _getOutlineIconColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.outlineDisabled.iconColor;
    } else {
      return buttonTheme.outlineNormal.iconColor;
    }
  }

  Color _getGhostIconColor({
    required DSButtonState state,
    required DSButtonIconCircleThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.ghostDisabled.iconColor;
    } else {
      return buttonTheme.ghostNormal.iconColor;
    }
  }
}
