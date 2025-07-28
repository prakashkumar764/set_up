import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/models/button/ds_button_spec.dart';
import 'package:flutter/material.dart';

class DSButtonContent extends StatelessWidget {
  final DSButtonState state;
  final String text;
  final String loadingText;
  final String? leadingIconPath;
  final DSButtonIconSize? leadingIconSize;
  final String? trailingIconPath;
  final DSButtonIconSize? trailingIconSize;
  final DSButtonSpec buttonSpec;
  final DSButtonSize size;
  final BoxDecoration decoration;
  final Color textColor;
  final Color? iconColor;
  final Color? loadingIconColor;

  const DSButtonContent({
    required this.state,
    required this.text,
    required this.loadingText,
    required this.leadingIconPath,
    required this.leadingIconSize,
    required this.trailingIconPath,
    required this.trailingIconSize,
    required this.buttonSpec,
    required this.size,
    required this.decoration,
    required this.textColor,
    this.iconColor,
    this.loadingIconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = state == DSButtonState.loading ? loadingText : text;

    final children = <Widget>[];

    // Leading icon
    if (leadingIconPath != null) {
      children.add(
        DSImage.asset(
          leadingIconPath!,
          width: leadingIconSize?.size,
          height: leadingIconSize?.size,
          color: iconColor,
        ),
      );
    }

    // Text
    children.add(
      Flexible(
        child: DSText(
          text: displayText,
          textStyle: DSTextStyleType.primaryButtonLRegular,
          textColor: textColor,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    // Trailing icon or loading indicator
    if (state == DSButtonState.loading) {
      children.add(
        SizedBox(
          width: trailingIconSize?.size,
          height: trailingIconSize?.size,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            strokeCap: StrokeCap.round,
            valueColor:
                loadingIconColor != null
                    ? AlwaysStoppedAnimation<Color>(loadingIconColor!)
                    : null,
          ),
        ),
      );
    } else if (trailingIconPath != null) {
      children.add(
        DSImage.asset(
          trailingIconPath!,
          width: trailingIconSize?.size,
          height: trailingIconSize?.size,
          color: iconColor,
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      decoration: decoration,
      padding: buttonSpec.buttonPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: buttonSpec.contentSpacing,
        children: children,
      ),
    );
  }
}
