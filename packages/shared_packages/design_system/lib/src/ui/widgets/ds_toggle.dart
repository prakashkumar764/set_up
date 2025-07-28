import 'package:design_system/design_system.dart';
import 'package:design_system/src/ui/models/toggle/ds_toggle_status.dart';
import 'package:flutter/material.dart';

class DSToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;
  final String? label;

  const DSToggle({
    required this.value,
    required this.onChanged,
    super.key,
    this.enabled = true,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final style = ToggleUtils().getToggleStyle(
      state: enabled ? DSToggleState.normal : DSToggleState.disabled,
      status: value ? DSToggleStatus.on : DSToggleStatus.off,
      dsColor: context.dsColors,
    );
    final spec = DesignSystemUtil().getDSToggleSizeSpec();
    return GestureDetector(
      onTap: enabled ? () => onChanged(!value) : null,
      child: Row(
        spacing: context.dsSpacing.sp200,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: spec.width,
            height: spec.height,
            padding: spec.padding,
            decoration: BoxDecoration(
              color: style.backgroundColor,
              borderRadius: BorderRadius.circular(spec.borderRadius),
            ),
            child: Align(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: spec.thumbRadius * 2,
                height: spec.thumbRadius * 2,
                decoration: BoxDecoration(
                  color: style.thumbColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          if (label != null && label!.isNotEmpty) ...{
            Flexible(
              child: DSText(
                text: label ?? "",
                textStyle: DSTextStyleType.primaryButtonLMedium,
                textColor: style.labelTextColor,
              ),
            ),
          },
        ],
      ),
    );
  }
}
