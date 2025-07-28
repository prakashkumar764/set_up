import 'package:design_system/src/resources/ds_icons.dart';
import 'package:design_system/src/theme_extensions/ds_text_input_theme_extension.dart';
import 'package:design_system/src/ui/models/text_input/ds_text_input_state.dart';
import 'package:flutter/material.dart';

class TextInputUtils {
  TextInputUtils._();

  static final TextInputUtils _instance = TextInputUtils._();

  factory TextInputUtils() => _instance;

  Color backgroundColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.background;
    }

    switch (state) {
      case DSTextInputState.error:
        return textInputTheme.error.background;
      case DSTextInputState.errorActive:
        return textInputTheme.errorActive.background;
      case DSTextInputState.warning:
        return textInputTheme.warning.background;
      case DSTextInputState.warningActive:
        return textInputTheme.warningActive.background;
      case DSTextInputState.success:
        return textInputTheme.success.background;
      case DSTextInputState.successActive:
        return textInputTheme.successActive.background;
      default:
        return textInputTheme.defaultState.background;
    }
  }

  Color borderColor({
    required bool enabled,
    required DSTextInputState state,
    required bool isFocused,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.border;
    }

    if (isFocused) {
      return textInputTheme.active.border;
    }

    switch (state) {
      case DSTextInputState.error:
      case DSTextInputState.errorActive:
        return textInputTheme.error.border;
      case DSTextInputState.warning:
      case DSTextInputState.warningActive:
        return textInputTheme.warning.border;
      case DSTextInputState.success:
      case DSTextInputState.successActive:
        return textInputTheme.success.border;
      default:
        return textInputTheme.defaultState.border;
    }
  }

  Color textColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.color;
    }
    return textInputTheme.defaultState.color;
  }

  Color hintColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.hintTextColor;
    }
    return textInputTheme.defaultState.hintTextColor;
  }

  Color labelColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.labelColor;
    }
    return textInputTheme.defaultState.labelColor;
  }

  Color captionColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.captionColor;
    }

    switch (state) {
      case DSTextInputState.error:
      case DSTextInputState.errorActive:
        return textInputTheme.error.captionColor;
      case DSTextInputState.warning:
      case DSTextInputState.warningActive:
        return textInputTheme.warning.captionColor;
      case DSTextInputState.success:
      case DSTextInputState.successActive:
        return textInputTheme.success.captionColor;
      default:
        return textInputTheme.defaultState.captionColor;
    }
  }

  Color leadingIconColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.leadingIconColor;
    }

    switch (state) {
      case DSTextInputState.error:
      case DSTextInputState.errorActive:
      case DSTextInputState.warning:
      case DSTextInputState.warningActive:
      case DSTextInputState.success:
      case DSTextInputState.successActive:
        return textInputTheme.success.leadingIconColor;
      default:
        return textInputTheme.defaultState.leadingIconColor;
    }
  }

  Color trailingIconColor({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    if (!enabled || state == DSTextInputState.disabled) {
      return textInputTheme.disabled.trailingIconColor;
    }

    switch (state) {
      case DSTextInputState.error:
      case DSTextInputState.errorActive:
      case DSTextInputState.warning:
      case DSTextInputState.warningActive:
      case DSTextInputState.success:
      case DSTextInputState.successActive:
        return textInputTheme.success.trailingIconColor;
      default:
        return textInputTheme.defaultState.trailingIconColor;
    }
  }

  (String?, Color?) getCaptionIconRecord({
    required bool enabled,
    required DSTextInputState state,
    required DSTextInputThemeExtension textInputTheme,
  }) {
    String? captionIconPath;
    Color? captionIconColor;

    switch (state) {
      case DSTextInputState.error:
      case DSTextInputState.errorActive:
        captionIconPath = DSIcons.icWarningInformation;
        captionIconColor = textInputTheme.error.captionIconColor;
      case DSTextInputState.warning:
      case DSTextInputState.warningActive:
        captionIconPath = DSIcons.icWarning;
        captionIconColor = textInputTheme.warning.captionIconColor;
      case DSTextInputState.success:
      case DSTextInputState.successActive:
        captionIconPath = DSIcons.icCheck;
        captionIconColor = textInputTheme.success.captionIconColor;
      default:
        captionIconPath = null;
        captionIconColor = null;
    }

    return (captionIconPath, captionIconColor);
  }
}
