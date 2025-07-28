import 'dart:ui';

class DSTextInputColors {
  final Color background;
  final Color color;
  final Color hintTextColor;
  final Color border;
  final Color leadingIconColor;
  final Color trailingIconColor;
  final Color labelColor;
  final Color captionColor;
  final Color? captionIconColor;

  const DSTextInputColors({
    required this.background,
    required this.color,
    required this.hintTextColor,
    required this.border,
    required this.leadingIconColor,
    required this.trailingIconColor,
    required this.labelColor,
    required this.captionColor,
    this.captionIconColor,
  });
}
