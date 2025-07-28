import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:styleguide/src/util/styleguide_utils.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

@UseCase(name: 'default', type: DSText)
Widget buildDSTextDefaultUseCase(BuildContext context) {
  final localization = StyleguideLocalizations.of(context)!;
  final textColorsMap = StyleguideUtils().getTextColorsMap(context: context);

  return DSText(
    text: context.knobs.stringOrNull(
      label: localization.styleguide_text_label,
      initialValue: localization.dsText_helloWorldFromDsText,
    ),
    textStyle: context.knobs.list<DSTextStyleType>(
      label: localization.dsText_textStyle_label,
      options: DSTextStyleType.values,
      initialOption: DSTextStyleType.primaryHeadingXxl,
      labelBuilder: (value) => value.name,
    ),
    textColor: context.knobs.list<Color>(
      label: localization.dsText_textColor_label,
      options: textColorsMap.values.toList(),
      initialOption: textColorsMap.values.first,
      labelBuilder:
          (value) => textColorsMap.keys.firstWhere(
            (key) => textColorsMap[key] == value,
          ),
    ),
    textAlign: context.knobs.listOrNull<TextAlign>(
      label: localization.dsText_textAlign_label,
      options: TextAlign.values,
      initialOption: null,
      labelBuilder: (value) => value?.name ?? "",
    ),
    maxLines: context.knobs.intOrNull.input(
      label: localization.dsText_maxLines_label,
      initialValue: null,
    ),
    overflow: context.knobs.listOrNull<TextOverflow>(
      label: localization.dsText_overflow_label,
      options: TextOverflow.values,
      initialOption: null,
      labelBuilder: (value) => value?.name ?? "",
    ),
  );
}
