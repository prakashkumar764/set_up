import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/models/button/ds_button_spec.dart';
import 'package:flutter/material.dart';

class DSButtonSpecSmall {
  static const DSButtonSpec mobile = DSButtonSpec(
    buttonHeight: 42,
    buttonIconSize: DSButtonIconSize.medium,
    contentSpacing: DSSpacing.sp200,
    buttonPadding: EdgeInsets.symmetric(
      horizontal: DSSpacing.sp300,
      vertical: DSSpacing.sp200,
    ),
  );

  static const DSButtonSpec tablet = DSButtonSpec(
    buttonHeight: 48,
    buttonIconSize: DSButtonIconSize.medium,
    contentSpacing: DSSpacing.sp200,
    buttonPadding: EdgeInsets.symmetric(
      horizontal: DSSpacing.sp400,
      vertical: DSSpacing.sp200,
    ),
  );
}
