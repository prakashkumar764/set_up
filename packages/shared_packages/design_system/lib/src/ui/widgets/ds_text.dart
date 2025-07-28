import 'package:design_system/src/shared/ds_text_style_type.dart';
import 'package:flutter/material.dart';

class DSText extends StatelessWidget {
  final String? text;
  final InlineSpan? textSpan;
  final DSTextStyleType textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color textColor;
  final double? lineHeight;

  const DSText({
    required this.text,
    required this.textStyle,
    required this.textColor,
    super.key,
    this.textSpan,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.lineHeight,
  });

  const DSText.rich({
    required this.textSpan,
    required this.textStyle,
    required this.textColor,
    super.key,
    this.text,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (textSpan != null) {
      return Text.rich(
        key: key,
        textSpan!,
        textAlign: textAlign,
        style: textStyle.getTextStyle().copyWith(
          color: textColor,
          height: lineHeight,
        ),
        maxLines: maxLines,
        overflow: overflow,
      );
    } else {
      return text != null && text?.isNotEmpty == true
          ? Text(
            key: key,
            text!,
            textAlign: textAlign,
            style: textStyle.getTextStyle().copyWith(
              color: textColor,
              height: lineHeight,
            ),
            maxLines: maxLines,
            overflow: overflow,
          )
          : const SizedBox.shrink();
    }
  }
}
