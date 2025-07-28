import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSCheckbox extends StatefulWidget {
  final DSCheckboxState state;
  final bool disabled;
  final String? label;
  final ValueChanged<DSCheckboxState> onChanged;

  const DSCheckbox({
    required this.state,
    required this.onChanged,
    this.label,
    this.disabled = false,
    super.key,
  });

  @override
  State<DSCheckbox> createState() => _DSCheckboxState();
}

class _DSCheckboxState extends State<DSCheckbox> {
  void _handleTap() {
    if (widget.disabled) return;

    final updatedState =
        widget.state == DSCheckboxState.unSelected
            ? DSCheckboxState.selected
            : DSCheckboxState.unSelected;

    widget.onChanged(updatedState);
  }

  Color _resolveBorderColor({
    required bool isChecked,
    required bool isIndeterminate,
  }) {
    final isSelected = isChecked || isIndeterminate;
    if (isSelected) {
      return widget.disabled
          ? context.dsColors.surfacePrimaryDisabled
          : context.dsColors.surfacePrimaryDefault;
    }
    return widget.disabled
        ? context.dsColors.surfacePrimaryDisabled
        : context.dsColors.surfaceNeutralContainer5;
  }

  Color _resolveFillColor({
    required bool isChecked,
    required bool isIndeterminate,
  }) {
    if (isChecked || isIndeterminate) {
      return widget.disabled
          ? context.dsColors.surfacePrimaryDisabled
          : context.dsColors.surfacePrimaryDefault;
    }
    return context.dsColors.surfaceNeutralContainerWhite;
  }

  @override
  Widget build(BuildContext context) {
    final isChecked = widget.state == DSCheckboxState.selected;
    final isIndeterminate = widget.state == DSCheckboxState.indeterminate;
    final spec = DesignSystemUtil.getDSCheckboxSizeSpec();

    final borderColor = _resolveBorderColor(
      isChecked: isChecked,
      isIndeterminate: isIndeterminate,
    );
    final fillColor = _resolveFillColor(
      isChecked: isChecked,
      isIndeterminate: isIndeterminate,
    );

    final Widget? icon =
        widget.state != DSCheckboxState.unSelected
            ? DSImage.asset(isChecked ? DSIcons.icCheck : DSIcons.icMinus)
            : null;

    return GestureDetector(
      onTap: _handleTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            width: spec.size,
            height: spec.size,
            decoration: BoxDecoration(
              color: fillColor,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(context.dsRadius.rd100),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          DSSpacingWidget.horizontal(spacing: context.dsSizes.sz300),
          if (widget.label != null && widget.label!.isNotEmpty)
            Flexible(
              child: DSText(
                text: widget.label,
                textStyle: DSTextStyleType.primaryButtonLMedium,
                textColor: context.dsColors.textNeutralOnWhite,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
