import 'package:design_system/src/theme_extensions/button/ds_button_icon_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class ButtonIconUtils {
  ButtonIconUtils._();

  static final ButtonIconUtils _instance = ButtonIconUtils._();

  factory ButtonIconUtils() => _instance;

  Color getBackgroundColor({
    required DSButtonState state,
    required DSButtonIconType type,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonIconType.fill:
        return _getFillColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconType.outline:
        return _getOutlineBackgroundColor(
          state: state,
          buttonTheme: buttonTheme,
        );
      case DSButtonIconType.ghost:
        return _getGhostBackgroundColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconType.ghostNeutral:
        return _getGhostNeutralBackgroundColor(
          state: state,
          buttonTheme: buttonTheme,
        );
    }
  }

  Color _getFillColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
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

  Color _getOutlineBackgroundColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
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
    required DSButtonIconThemeExtension buttonTheme,
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

  Color _getGhostNeutralBackgroundColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
      case DSButtonState.disabled:
      case DSButtonState.loading:
        return buttonTheme.ghostNeutralNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.ghostNeutralPressed.background;
    }
  }

  Color? getBorderColor({
    required DSButtonIconType type,
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    if (type == DSButtonIconType.outline && state != DSButtonState.disabled) {
      return buttonTheme.outlineNormal.border ?? DSSemanticColors.strokePrimaryDefault;
    } else {
      return buttonTheme.fillNormal.border;
    }
  }

  Color getIconColor({
    required DSButtonState state,
    required DSButtonIconType type,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonIconType.fill:
        return _getFillIconColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconType.outline:
        return _getOutlineIconColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconType.ghost:
        return _getGhostIconColor(state: state, buttonTheme: buttonTheme);
      case DSButtonIconType.ghostNeutral:
        return _getGhostNeutralIconColor(
          state: state,
          buttonTheme: buttonTheme,
        );
    }
  }

  Color _getFillIconColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.loading) {
      return buttonTheme.fillLoading.iconColor;
    } else if (state == DSButtonState.disabled) {
      return buttonTheme.fillDisabled.iconColor;
    } else {
      return buttonTheme.fillNormal.iconColor;
    }
  }

  Color _getOutlineIconColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.outlineDisabled.iconColor;
    } else {
      return buttonTheme.outlineNormal.iconColor;
    }
  }

  Color _getGhostIconColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.ghostDisabled.iconColor;
    } else {
      return buttonTheme.ghostNormal.iconColor;
    }
  }

  Color _getGhostNeutralIconColor({
    required DSButtonState state,
    required DSButtonIconThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return buttonTheme.ghostNeutralDisabled.iconColor;
    } else {
      return buttonTheme.ghostNeutralNormal.iconColor;
    }
  }
}
