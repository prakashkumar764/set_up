import 'package:design_system/design_system.dart';
import 'package:design_system/src/theme_extensions/ds_theme_build_context_extension.dart';
import 'package:design_system/src/util/button/button_icon_utils.dart';
import 'package:flutter/material.dart';

class DSButtonIcon extends StatefulWidget {
  const DSButtonIcon({
    required this.iconPath,
    required this.onPressed,
    this.size = DSButtonIconSizeEnum.large,
    this.type = DSButtonIconType.fill,
    this.state = DSButtonState.normal,
    super.key,
  });

  final String iconPath;
  final VoidCallback? onPressed;
  final DSButtonIconSizeEnum size;
  final DSButtonIconType type;
  final DSButtonState state;

  @override
  State<DSButtonIcon> createState() => _DSButtonIconState();
}

class _DSButtonIconState extends State<DSButtonIcon> {
  bool _isPressed = false;

  DSButtonState get _currentState {
    if (widget.state != DSButtonState.normal) {
      return widget.state;
    }
    if (_isPressed) {
      return DSButtonState.pressed;
    }
    return DSButtonState.normal;
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = DesignSystemUtil().isTablet();
    final spec = widget.size.getButtonIconSizeSpec(isTablet: isTablet);
    final iconSize = spec.iconSize;
    final buttonTheme = context.dsButtonIconTheme;
    final iconColor = ButtonIconUtils().getIconColor(
      state: _currentState,
      type: widget.type,
      buttonTheme: buttonTheme,
    );
    final borderColor = ButtonIconUtils().getBorderColor(
      type: widget.type,
      state: _currentState,
      buttonTheme: buttonTheme,
    );

    return GestureDetector(
      onTapDown:
          _isInteractionDisabled()
              ? null
              : (_) {
                setState(() => _isPressed = true);
              },
      onTapUp:
          _isInteractionDisabled()
              ? null
              : (_) {
                setState(() => _isPressed = false);
                widget.onPressed?.call();
              },
      onTapCancel:
          _isInteractionDisabled()
              ? null
              : () {
                setState(() => _isPressed = false);
              },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        width: spec.size,
        height: spec.size,
        padding: EdgeInsets.all(spec.buttonPadding),
        decoration: BoxDecoration(
          color: ButtonIconUtils().getBackgroundColor(
            state: _currentState,
            type: widget.type,
            buttonTheme: buttonTheme,
          ),
          borderRadius: BorderRadius.circular(spec.borderRadius),
          border:
              _shouldShowBorder() && borderColor != null
                  ? Border.all(color: borderColor, width: spec.borderWidth)
                  : null,
        ),
        child: Center(
          child:
              widget.state == DSButtonState.loading
                  ? SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: Padding(
                      padding: EdgeInsets.all(spec.loadingIconPadding),
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        strokeCap: StrokeCap.round,
                        valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                      ),
                    ),
                  )
                  : DSImage.asset(widget.iconPath, color: iconColor),
        ),
      ),
    );
  }

  bool _isInteractionDisabled() {
    return widget.state == DSButtonState.disabled ||
        widget.state == DSButtonState.loading;
  }

  bool _shouldShowBorder() {
    return widget.type == DSButtonIconType.outline;
  }
}
