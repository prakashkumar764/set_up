import 'package:flutter/cupertino.dart';

class DSTextInputSpec {
  const DSTextInputSpec({
    required this.textInputHeight,
    required this.containerPadding,
    this.captionIconSize,
  });

  final double textInputHeight;
  final EdgeInsets containerPadding;
  final double? captionIconSize;
}
