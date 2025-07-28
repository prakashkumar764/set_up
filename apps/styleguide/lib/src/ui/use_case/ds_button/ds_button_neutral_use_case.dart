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

@UseCase(name: 'ds_button_neutral_use_case', type: DSButtonNeutral)
Widget buildDSButtonNeutralUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;

  return Center(
    child: DSButtonNeutral(
      type: context.knobs.list<DSButtonNeutralType>(
        label: localizations.styleguide_type_label,
        options: DSButtonNeutralType.values,
        labelBuilder: (value) => value.name,
      ),
      text: context.knobs.string(
        label: localizations.styleguide_text_label,
        initialValue: localizations.styleguide_button_initialText,
      ),
      loadingText: context.knobs.string(
        label: localizations.styleguide_loadingText_label,
        initialValue: localizations.styleguide_loadingText_initialText,
      ),
      size: context.knobs.list<DSButtonSize>(
        label: localizations.styleguide_size_label,
        options: DSButtonSize.values,
        initialOption: DSButtonSize.large,
        labelBuilder: (value) => value.name,
      ),
      state: context.knobs.list<DSButtonState>(
        label: localizations.styleguide_state_label,
        options: DSButtonState.values,
        initialOption: DSButtonState.normal,
        labelBuilder: (value) => value.name,
      ),
      iconSize: context.knobs.listOrNull(
        label: localizations.styleguide_iconSize_label,
        options: DSButtonIconSize.values,
        labelBuilder: (value) => value?.name ?? '',
      ),
      leadingIconPath: context.knobs.listOrNull<String>(
        label: localizations.styleguide_leadingIconPath_label,
        options: _iconOptions,
        initialOption: null,
        labelBuilder: _iconLabelBuilder,
      ),
      trailingIconPath: context.knobs.listOrNull<String>(
        label: localizations.styleguide_trailingIconPath_label,
        options: _iconOptions,
        initialOption: null,
        labelBuilder: _iconLabelBuilder,
      ),
      width: context.knobs.doubleOrNull.input(
        label: localizations.styleguide_width_label,
        initialValue: null,
      ),
      onPressed: () {},
    ),
  );
}
