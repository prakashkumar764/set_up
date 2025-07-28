import 'package:design_system/src/theme_extensions/button/ds_button_primary_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

class ButtonPrimaryUtils {
  ButtonPrimaryUtils._();

  static final ButtonPrimaryUtils _instance = ButtonPrimaryUtils._();

  factory ButtonPrimaryUtils() => _instance;

  BoxDecoration getDecoration({
    required DSButtonType type,
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonType.fill:
        return BoxDecoration(
          color: _getFillColor(state: state, buttonTheme: buttonTheme),
          borderRadius: BorderRadius.circular(DSRadius.rd200),
          border: _getFillBoxBorder(state: state, buttonTheme: buttonTheme),
        );
      case DSButtonType.outline:
        return BoxDecoration(
          color: _getOutlineBackgroundColor(
            state: state,
            buttonTheme: buttonTheme,
          ),
          borderRadius: BorderRadius.circular(DSRadius.rd200),
          border: Border.all(
            color: _getOutlineBorderColor(
              state: state,
              buttonTheme: buttonTheme,
            ),
            width: 1,
          ),
        );
      case DSButtonType.ghost:
        return BoxDecoration(
          color: _getGhostBackgroundColor(
            state: state,
            buttonTheme: buttonTheme,
          ),
          borderRadius: BorderRadius.circular(DSRadius.rd200),
        );
    }
  }

  Color _getFillColor({
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
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

  BoxBorder? _getFillBoxBorder({
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    if (state == DSButtonState.disabled) {
      return Border.all(
        color:
        buttonTheme.fillDisabled.border ??
            DSSemanticColors.strokeNeutralDefault,
      );
    }
    return null;
  }

  Color _getOutlineBackgroundColor({
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
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
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
        return buttonTheme.outlineNormal.border ?? Colors.transparent;
      case DSButtonState.pressed:
        return buttonTheme.outlinePressed.border ?? Colors.transparent;
      case DSButtonState.disabled:
        return buttonTheme.outlineDisabled.border ?? Colors.transparent;
      case DSButtonState.loading:
        return buttonTheme.outlineLoading.border ?? Colors.transparent;
    }
  }

  Color _getGhostBackgroundColor({
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    switch (state) {
      case DSButtonState.normal:
        return buttonTheme.ghostNormal.background;
      case DSButtonState.pressed:
        return buttonTheme.ghostPressed.background;
      case DSButtonState.disabled:
        return buttonTheme.ghostDisabled.background;
      case DSButtonState.loading:
        return buttonTheme.ghostLoading.background;
    }
  }

  Color getTextColor({
    required DSButtonType type,
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonType.fill:
        return state == DSButtonState.disabled
            ? buttonTheme.fillDisabled.textColor
            : buttonTheme.fillNormal.textColor;
      case DSButtonType.outline:
      case DSButtonType.ghost:
        return state == DSButtonState.disabled
            ? buttonTheme.outlineDisabled.textColor
            : buttonTheme.outlineNormal.textColor;
    }
  }

  Color getIconColor({
    required DSButtonType type,
    required DSButtonState state,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonType.fill:
        return state == DSButtonState.disabled
            ? buttonTheme.fillDisabled.iconColor
            : buttonTheme.fillNormal.iconColor;
      case DSButtonType.outline:
      case DSButtonType.ghost:
        return state == DSButtonState.disabled
            ? buttonTheme.outlineDisabled.iconColor
            : buttonTheme.outlineNormal.iconColor;
    }
  }

  Color getLoadingIconColor({
    required DSButtonType type,
    required DSButtonPrimaryThemeExtension buttonTheme,
  }) {
    switch (type) {
      case DSButtonType.fill:
        return buttonTheme.fillLoading.loadingIconColor ??
            DSSemanticColors.strokeNeutralDefault;
      case DSButtonType.outline:
      case DSButtonType.ghost:
        return buttonTheme.outlineLoading.loadingIconColor ??
            DSSemanticColors.strokePrimaryDefault;
    }
  }
}
