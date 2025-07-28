import 'package:design_system/src/theme_extensions/ds_theme_build_context_extension.dart';
import 'package:design_system/src/ui/models/button/ds_button_icon_size.dart';
import 'package:design_system/src/ui/models/button/ds_button_size.dart';
import 'package:design_system/src/ui/models/button/ds_button_state.dart';
import 'package:design_system/src/ui/widgets/button/ds_button_content.dart';
import 'package:design_system/src/util/button/button_tertiary_utils.dart';
import 'package:design_system/src/util/design_system_util.dart';
import 'package:flutter/material.dart';

class DSButtonTertiary extends StatefulWidget {
  const DSButtonTertiary({
    required this.text,
    this.onPressed,
    this.leadingIconPath,
    this.trailingIconPath,
    this.iconSize,
    // Using ButtonSize for both Primary and Secondary buttons
    // If needed, create separate spec getter in ButtonSize class
    this.size = DSButtonSize.large,
    this.width,
    this.state = DSButtonState.normal,
    this.loadingText = 'Loading...',
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final String? leadingIconPath;
  final String? trailingIconPath;
  final DSButtonIconSize? iconSize;
  final DSButtonSize size;
  final double? width;
  final DSButtonState state;
  final String loadingText;

  @override
  State<DSButtonTertiary> createState() => _DSButtonTertiaryState();
}

class _DSButtonTertiaryState extends State<DSButtonTertiary> {
  bool _isPressed = false;

  DSButtonState get _currentState {
    // If widget state is not normal, use that state
    if (widget.state != DSButtonState.normal) return widget.state;
    // Otherwise, use pressed state if user is pressing
    if (_isPressed) return DSButtonState.pressed;
    return DSButtonState.normal;
  }

  bool get _isInteractive =>
      widget.state == DSButtonState.normal && widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    final isTablet = DesignSystemUtil().isTablet();
    final spec = widget.size.getButtonSizeSpec(isTablet: isTablet);
    final effectiveIconSize = widget.iconSize ?? spec.buttonIconSize;
    final buttonTheme = context.dsButtonTertiaryTheme;

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: spec.buttonHeight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 144),
        child: GestureDetector(
          onTapDown: _isInteractive ? (_) => _setPressed(true) : null,
          onTapUp: _isInteractive ? (_) => _setPressed(false) : null,
          onTapCancel: _isInteractive ? () => _setPressed(false) : null,
          onTap: _isInteractive ? widget.onPressed : null,
          child: DSButtonContent(
            state: _currentState,
            text: widget.text,
            loadingText: widget.loadingText,
            leadingIconPath: widget.leadingIconPath,
            leadingIconSize: effectiveIconSize,
            trailingIconPath: widget.trailingIconPath,
            trailingIconSize: effectiveIconSize,
            buttonSpec: spec,
            size: widget.size,
            decoration: ButtonTertiaryUtils().getDecoration(
              state: _currentState,
              buttonTheme: buttonTheme,
            ),
            textColor: ButtonTertiaryUtils().getTextColor(
              state: _currentState,
              buttonTheme: buttonTheme,
            ),
            iconColor: ButtonTertiaryUtils().getIconColor(
              state: _currentState,
              buttonTheme: buttonTheme,
            ),
            loadingIconColor: buttonTheme.fillLoading.loadingIconColor,
          ),
        ),
      ),
    );
  }

  void _setPressed(bool pressed) {
    if (mounted) {
      setState(() => _isPressed = pressed);
    }
  }
}
