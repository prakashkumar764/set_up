import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DSCarouselIndicator extends StatelessWidget {
  final List<Widget> slidesList;
  final int selectedIndex;
  final Color? backgroundColor;
  const DSCarouselIndicator({
    required this.slidesList,
    required this.selectedIndex,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var spec = DesignSystemUtil().getDSCarouselIndicatorSizeSpec();
    return Container(
      padding: spec.padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? DSBaseColors.neutral0.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            slidesList.asMap().entries.map((entry) {
              final isSelected = selectedIndex == entry.key;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isSelected ? spec.selectedWidth : spec.unSelectedWidth,
                height: spec.height,
                margin: spec.margin,
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? context.dsColors.iconBrandDefault
                          : context.dsColors.iconBrandDisabled,
                  borderRadius: BorderRadius.circular(99),
                ),
              );
            }).toList(),
      ),
    );
  }
}
