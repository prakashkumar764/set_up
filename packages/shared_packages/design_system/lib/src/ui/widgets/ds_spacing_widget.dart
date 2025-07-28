import 'package:design_system/src/ui/models/ds_spacing_widget_type.dart';
import 'package:flutter/material.dart';

class DSSpacingWidget extends StatelessWidget {
  final DSSpacingWidgetType _type;
  final double spacing;

  const DSSpacingWidget.horizontal({required this.spacing, super.key})
    : _type = DSSpacingWidgetType.horizontal;

  const DSSpacingWidget.vertical({required this.spacing, super.key})
    : _type = DSSpacingWidgetType.vertical;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case DSSpacingWidgetType.horizontal:
        return SizedBox(width: spacing);
      case DSSpacingWidgetType.vertical:
        return SizedBox(height: spacing);
    }
  }
}
