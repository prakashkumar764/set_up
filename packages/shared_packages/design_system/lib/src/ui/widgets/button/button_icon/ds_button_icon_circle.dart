import 'package:design_system/src/theme_extensions/ds_theme_build_context_extension.dart';
import 'package:design_system/src/ui/models/button/button_icon/button_icon_circle/ds_button_icon_circle_type.dart';
import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_size_enum.dart';
import 'package:design_system/src/ui/models/button/ds_button_state.dart';
import 'package:design_system/src/ui/widgets/ds_image.dart';
import 'package:design_system/src/util/button/button_icon_circle_utils.dart';
import 'package:design_system/src/util/design_system_util.dart';
import 'package:design_system/theme/theme.dart';
import 'package:flutter/material.dart';

class DSButtonIconCircle extends StatefulWidget {
  const DSButtonIconCircle({
    required this.iconPath,
    required this.onPressed,
    this.size = DSButtonIconSizeEnum.large,
    this.type = DSButtonIconCircleType.fill,
    this.state = DSButtonState.normal,
    super.key,
  });

  final String iconPath;
  final VoidCallback? onPressed;
  final DSButtonIconSizeEnum size;
  final DSButtonIconCircleType type;
  final DSButtonState state;

  @override
  State<DSButtonIconCircle> createState() => _DSButtonIconCircleState();
}

class _DSButtonIconCircleState extends State<DSButtonIconCircle> {
  bool _isPressed = false;

  DSButtonState get _currentState {
    if (widget.state == DSButtonState.disabled ||
        widget.state == DSButtonState.loading) {
      return widget.state;
    }
    if (_isPressed) return DSButtonState.pressed;
    return DSButtonState.normal;
  }

  @override
  Widget build(BuildContext context) {
    final spec = widget.size.getButtonIconSizeSpec(
      isTablet: DesignSystemUtil().isTablet(),
    );
    final buttonTheme = context.dsButtonIconCircleTheme;
    final iconColor = ButtonIconCircleUtils().getIconColor(
      state: _currentState,
      type: widget.type,
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
          color: ButtonIconCircleUtils().getBackgroundColor(
            state: _currentState,
            type: widget.type,
            buttonTheme: buttonTheme,
          ),
          borderRadius: BorderRadius.circular(context.dsRadius.rd1000),
          border:
              _shouldShowBorder()
                  ? Border.all(
                    color: ButtonIconCircleUtils().getBorderColor(
                      buttonTheme: buttonTheme,
                    ),
                    width: spec.borderWidth,
                  )
                  : null,
        ),
        child: Center(
          child:
              widget.state == DSButtonState.loading
                  ? Padding(
                    padding: EdgeInsets.all(spec.loadingIconPadding),
                    child: CircularProgressIndicator(
                      strokeWidth: context.dsSizes.sz100,
                      strokeCap: StrokeCap.round,
                      valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                    ),
                  )
                  : DSImage.asset(
                    widget.iconPath,
                    width: spec.iconSize,
                    height: spec.iconSize,
                    color: iconColor,
                  ),
        ),
      ),
    );
  }

  bool _isInteractionDisabled() {
    return widget.state == DSButtonState.disabled ||
        widget.state == DSButtonState.loading;
  }

  bool _shouldShowBorder() {
    return widget.type == DSButtonIconCircleType.outline &&
        widget.state != DSButtonState.disabled;
  }
}
