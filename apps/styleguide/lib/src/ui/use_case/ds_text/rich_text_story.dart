import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:styleguide/src/util/styleguide_utils.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

@UseCase(name: 'rich_text', type: DSText)
Widget buildDSTextRichTextUseCase(BuildContext context) {
  final localization = StyleguideLocalizations.of(context)!;
  final textColorsMap = StyleguideUtils().getTextColorsMap(context: context);
  final baseTextStyle = context.knobs.list<DSTextStyleType>(
    label: localization.dsText_textStyle_label,
    options: DSTextStyleType.values,
    initialOption: DSTextStyleType.primaryHeadingXxl,
    labelBuilder: (value) => value.name,
  );
  final baseTextColor = context.knobs.list<Color>(
    label: localization.dsText_textColor_label,
    options: textColorsMap.values.toList(),
    initialOption: textColorsMap.values.first,
    labelBuilder:
        (value) =>
            textColorsMap.keys.firstWhere((key) => textColorsMap[key] == value),
  );
  final italicTextColor = context.knobs.list<Color>(
    label: localization.dsText_italicTextColor_label,
    options: textColorsMap.values.toList(),
    initialOption: textColorsMap.values.last,
    labelBuilder:
        (value) =>
            textColorsMap.keys.firstWhere((key) => textColorsMap[key] == value),
  );

  return DSText.rich(
    textSpan: TextSpan(
      children: <InlineSpan>[
        TextSpan(
          text: context.knobs.string(
            label: localization.dsText_firstPartText_label,
            initialValue: localization.dsText_thisIs_value,
          ),
        ),
        TextSpan(
          text: context.knobs.string(
            label: localization.dsText_boldPartText_label,
            initialValue: localization.dsText_redText_value,
          ),
          style: DSTextStyleType.primaryButtonLRegular.getTextStyle().copyWith(
            color: context.dsColors.textSemanticOnError,
          ),
        ),
        TextSpan(
          text: context.knobs.string(
            label: localization.dsText_thirdPartText_label,
            initialValue: localization.dsText_andThisIs_value,
          ),
        ),
        TextSpan(
          text: context.knobs.string(
            label: localization.dsText_italicPartText_label,
            initialValue: localization.dsText_italicText_value,
          ),
          style: DSTextStyleType.primaryHeadingL.getTextStyle().copyWith(
            fontStyle: FontStyle.italic,
            color: italicTextColor,
          ),
        ),
        TextSpan(
          text: context.knobs.string(
            label: localization.dsText_finalPartText_label,
            initialValue: localization.dsText_backToBaseStyle_value,
          ),
        ),
      ],
    ),
    textColor: baseTextColor,
    textStyle: baseTextStyle,
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
