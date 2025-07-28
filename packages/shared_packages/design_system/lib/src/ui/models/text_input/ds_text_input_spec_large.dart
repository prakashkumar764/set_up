import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/models/text_input/ds_text_input_spec.dart';
import 'package:flutter/material.dart';

class DSTextInputSpecLarge {
  static const DSTextInputSpec mobile = DSTextInputSpec(
    textInputHeight: DSSize.sz800,
    containerPadding: EdgeInsets.symmetric(
      horizontal: DSSpacing.sp300,
      /// Vertical padding = 6 + offset (which is not given in Figma but can be calculated as follows:)
      /// (input height - vertical padding - leading icon size) / 2
      /// Offset = (48 - (6+6) - 20) / 2 => 16 / 2 => 8
      /// Vertical padding  = 6 + 8 = 14
      vertical: 14,
    ),
    captionIconSize: 12,
  );

  static const DSTextInputSpec tablet = DSTextInputSpec(
    textInputHeight: 52,
    containerPadding: EdgeInsets.symmetric(
      horizontal: DSSpacing.sp300,
      vertical: 12,
    ),
    captionIconSize: 12,
  );
}
