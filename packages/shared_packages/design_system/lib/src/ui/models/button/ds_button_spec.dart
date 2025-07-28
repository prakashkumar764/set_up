import 'package:design_system/src/ui/models/button/ds_button_icon_size.dart';
import 'package:flutter/cupertino.dart';

class DSButtonSpec {
  const DSButtonSpec({
    required this.buttonHeight,
    required this.buttonIconSize,
    required this.contentSpacing,
    required this.buttonPadding,
  });

  final double buttonHeight;
  final DSButtonIconSize buttonIconSize;
  final double contentSpacing;
  final EdgeInsets buttonPadding;
}
