import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/models/button/ds_button_spec.dart';
import 'package:flutter/material.dart';

class DSButtonSpecLarge {
  static const DSButtonSpec mobile = DSButtonSpec(
    buttonHeight: 60,
    buttonIconSize: DSButtonIconSize.medium,
    contentSpacing: DSSpacing.sp200,
    buttonPadding: EdgeInsets.symmetric(
      horizontal: DSSpacing.sp200,
      vertical: DSSpacing.sp200,
    ),
  );

  static const DSButtonSpec tablet = DSButtonSpec(
    buttonHeight: 64,
    buttonIconSize: DSButtonIconSize.medium,
    contentSpacing: DSSpacing.sp200,
    buttonPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );
}
