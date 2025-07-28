import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:styleguide/src/util/styleguide_utils.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

final _iconsMap = StyleguideUtils().getIconsNamePathMap();
final _iconOptions = _iconsMap.values.toList();
String _iconLabelBuilder(value) =>
    _iconsMap.keys.firstWhere((key) => _iconsMap[key] == value);

@UseCase(name: 'ds_search_use_case', type: DSSearch)
Widget buildDSSearchUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;

  final hintText = context.knobs.string(
    label: localizations.styleguide_hintText_label,
    initialValue: localizations.styleguide_search_hintText,
  );

  final leadingIcon = context.knobs.listOrNull<String>(
    label: localizations.styleguide_leadingIconPath_label,
    options: _iconOptions,
    initialOption: null,
    labelBuilder: _iconLabelBuilder,
  );

  final trailingIcon = context.knobs.listOrNull<String>(
    label: localizations.styleguide_trailingIconPath_label,
    options: _iconOptions,
    initialOption: null,
    labelBuilder: _iconLabelBuilder,
  );

  final iconSize = context.knobs.listOrNull<DSSearchIconSize>(
    label: localizations.styleguide_iconSize_label,
    options: DSSearchIconSize.values,
    labelBuilder: (value) => value?.name ?? '',
  );

  final backgroundColor = context.knobs.color(
    label: localizations.styleguide_backgroundColor_label,
    initialValue: Colors.grey[200]!,
  );

  final borderRadius = context.knobs.doubleOrNull.input(
    label: localizations.styleguide_border_radius_label,
    initialValue: 8.0,
  );

  final maxLines = context.knobs.int.input(
    label: localizations.styleguide_maxLines_label,
    initialValue: 1,
  )
      .toInt();

  return Center(
    child: DSSearch(
      hintText: hintText,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      iconSize: iconSize,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      maxLine: maxLines,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
  );
}
