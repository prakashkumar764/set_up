import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSToast extends StatelessWidget {
  final String title;
  final String? caption;
  final String? leadingIconPath;
  final bool showClose;
  final DSToastStyle toastStyle;
  final VoidCallback? onButtonTap;
  final VoidCallback? onDismissToast;
  final String? buttonText;

  const DSToast({
    required this.title,
    super.key,
    this.caption,
    this.leadingIconPath,
    this.onButtonTap,
    this.showClose = true,
    this.onDismissToast,
    this.toastStyle = DSToastStyle.light,
    this.buttonText,
  });

  static void show({
    required BuildContext context,
    required String title,
    String? caption,
    String? leadingIconPath,
    String? buttonText,
    bool showClose = true,
    VoidCallback? onButtonTap,
    DSToastDirection toastDirection = DSToastDirection.bottom,
    DSToastStyle appToastStyle = DSToastStyle.light,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder:
          (context) => Positioned(
            top:
                toastDirection == DSToastDirection.top
                    ? context.dsSpacing.sp900
                    : null,
            left: context.dsSpacing.sp400,
            right: context.dsSpacing.sp400,
            bottom:
                toastDirection == DSToastDirection.bottom
                    ? context.dsSpacing.sp900
                    : null,
            child: Material(
              color: Colors.transparent,
              child: DSToast(
                title: title,
                caption: caption,
                leadingIconPath: leadingIconPath,
                toastStyle: appToastStyle,
                showClose: showClose,
                onButtonTap: onButtonTap,
                buttonText: buttonText,
                onDismissToast: showClose ? () => entry.remove() : null,
              ),
            ),
          ),
    );

    overlay.insert(entry);

    if (!showClose) {
      Future.delayed(duration, () {
        if (entry.mounted) entry.remove();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = toastStyle == DSToastStyle.dark;
    final dsColors = context.dsColors;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.dsSpacing.sp400,
        vertical: context.dsSpacing.sp200,
      ),
      decoration: BoxDecoration(
        color:
            isDark
                ? dsColors.surfacePrimaryDefault
                : dsColors.surfaceNeutralBackgroundWhite,
        borderRadius: BorderRadius.circular(context.dsRadius.rd300),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 3,
            color: Colors.black.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: context.dsSpacing.sp400,
        children: [
          if (leadingIconPath != null) ...{
            DSImage.asset(
              leadingIconPath!,
              color:
              isDark ? dsColors.iconOnSurfaceDefault : dsColors.iconPrimary,
            ),
          },
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSText(
                  text: title,
                  textStyle: DSTextStyleType.primaryBodySMedium,
                  textColor:
                      isDark
                          ? dsColors.textOnSurfaceDefault
                          : dsColors.textNeutralOnWhite,
                ),
                if (caption != null)
                  DSText(
                    text: caption!,
                    textStyle: DSTextStyleType.primaryCaption,
                    textColor:
                        isDark
                            ? dsColors.textOnSurfaceDefault
                            : dsColors.textNeutralOnWhite,
                  ),
              ],
            ),
          ),
          if (onButtonTap != null)
            DSButtonPrimary(
              size: DSButtonSize.small,
              width: 100,
              text: buttonText ?? '',
              onPressed: onButtonTap,
            ),
          if (showClose)
            GestureDetector(
              onTap: onDismissToast ?? () => Navigator.pop(context),
              child: DSImage.asset(
                DSIcons.icClose,
                color:
                    isDark
                        ? dsColors.iconOnSurfaceDefault
                        : dsColors.iconPrimary,
              ),
            ),
        ],
      ),
    );
  }
}
