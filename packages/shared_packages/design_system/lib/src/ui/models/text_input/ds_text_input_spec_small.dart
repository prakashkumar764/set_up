import 'package:design_system/src/ui/models/text_input/ds_text_input_spec.dart';
import 'package:flutter/material.dart';

class DSTextInputSpecSmall {
  static const DSTextInputSpec mobile = DSTextInputSpec(
    textInputHeight: 32,
    containerPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    captionIconSize: 12,
  );

  static const DSTextInputSpec tablet = DSTextInputSpec(
    textInputHeight: 36,
    containerPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    captionIconSize: 12,
  );
}
