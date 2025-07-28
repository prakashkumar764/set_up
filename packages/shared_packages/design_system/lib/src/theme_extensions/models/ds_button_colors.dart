import 'dart:ui';

class DSButtonColors {
  final Color background;
  final Color textColor;
  final Color iconColor;
  final Color? loadingIconColor;
  final Color? border;

  const DSButtonColors({
    required this.background,
    required this.textColor,
    required this.iconColor,
    this.loadingIconColor,
    this.border,
  });
}
