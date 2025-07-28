import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSChecklistSelector extends StatelessWidget {
  final DSChecklistState state;
  final VoidCallback onTap;
  final double? borderWidth;
  final double? iconPadding;

  const DSChecklistSelector({
    required this.state,
    required this.onTap,
    this.borderWidth,
    this.iconPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = state == DSChecklistState.selected;
    final spec = DesignSystemUtil.getDSChecklistSizeSpec();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: spec.size,
        height: spec.size,
        padding: EdgeInsets.all(iconPadding ?? 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelected
                  ? context.dsColors.iconNeutralDefault
                  : context.dsColors.surfaceNeutralContainerWhite,
          border: Border.all(
            color: context.dsColors.iconNeutralDefault,
            width: borderWidth ?? 2.0,
          ),
        ),
        child: isSelected ? DSImage.asset(DSIcons.icCheck) : null,
      ),
    );
  }
}
