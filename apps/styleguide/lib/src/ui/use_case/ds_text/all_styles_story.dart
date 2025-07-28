import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/src/util/styleguide_utils.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';

@UseCase(name: 'all_styles', type: DSText)
Widget buildDSTextAllStylesUseCase(BuildContext context) {
  final localization = StyleguideLocalizations.of(context)!;
  final textColorsMap = StyleguideUtils().getTextColorsMap(context: context);
  final stringText = context.knobs.string(
    label: localization.styleguide_text_label,
    initialValue: localization.dsText_sampleText_value,
  );
  final color = context.knobs.list<Color>(
    label: localization.dsText_textColor_label,
    options: textColorsMap.values.toList(),
    initialOption: textColorsMap.values.first,
    labelBuilder:
        (value) =>
        textColorsMap.keys.firstWhere((key) => textColorsMap[key] == value),
  );

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      DSTextStyleType.values.map((style) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style.name,
                style: DSTextStyleType.primaryButtonSRegular.getTextStyle(),
              ),
              DSSpacingWidget.vertical(spacing: context.dsSpacing.sp100),
              DSText(text: stringText, textStyle: style, textColor: color),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    ),
  );
}