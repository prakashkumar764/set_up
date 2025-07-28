import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSSearch extends StatelessWidget {
  final VoidCallback? onTap;
  final String? leadingIcon;
  final String? trailingIcon;
  final String? hintText;
  final Color? backgroundColor;
  final double? borderRadius;
  final DSTextStyleType? textStyle;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final int maxLine;
  final DSSearchIconSize? iconSize;

  const DSSearch({
    this.onTap,
    this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.borderRadius,
    this.textStyle,
    this.textColor,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.maxLine = 1,
    this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyleType = DSTextStyleType.primaryBodyMRegular;
    final defaultTextColor = context.dsColors.textNeutralSecondary;
    final defaultBorderRadius = context.dsRadius.rd1000;
    final computedBackgroundColor =
        backgroundColor ?? context.dsColors.iconOnSurfaceDefault;

    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: computedBackgroundColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? defaultBorderRadius,
          ),
        ),
        child: Row(
          spacing: context.dsSpacing.sp200,
          children: [
            if (leadingIcon != null) ...{
              DSImage.asset(
                leadingIcon!,
                height: iconSize?.size ?? DSSearchIconSize.large.size,
                width: iconSize?.size ?? DSSearchIconSize.large.size,
              ),
            },
            if (hintText != null) ...{
              Expanded(
                child: DSText(
                  text: hintText,
                  maxLines: maxLine,
                  overflow: TextOverflow.ellipsis,
                  textStyle: textStyle ?? defaultTextStyleType,
                  textColor: textColor ?? defaultTextColor,
                ),
              ),
            } else ...{
              Spacer(),
            },
            if (trailingIcon != null) ...{
              DSImage.asset(
                trailingIcon!,
                height: iconSize?.size ?? DSSearchIconSize.large.size,
                width: iconSize?.size ?? DSSearchIconSize.large.size,
              ),
            },
          ],
        ),
      ),
    );
  }
}
