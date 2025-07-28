import 'dart:ui';

class DSButtonIconColors {
  final Color background;
  final Color iconColor;
  final Color? loadingIconColor;
  final Color? border;

  const DSButtonIconColors({
    required this.background,
    required this.iconColor,
    this.loadingIconColor,
    this.border,
  });
}
