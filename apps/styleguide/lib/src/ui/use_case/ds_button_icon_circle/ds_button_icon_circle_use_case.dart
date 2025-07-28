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

@UseCase(name: 'ds_button_icon_circle_use_case', type: DSButtonIconCircle)
Widget buildDSButtonIconCircleUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;

  return Center(
    child: DSButtonIconCircle(
      type: context.knobs.list<DSButtonIconCircleType>(
        label: localizations.styleguide_type_label,
        options: DSButtonIconCircleType.values,
        labelBuilder: (value) => value.name,
      ),
      size: context.knobs.list<DSButtonIconSizeEnum>(
        label: localizations.styleguide_size_label,
        options: DSButtonIconSizeEnum.values,
        initialOption: DSButtonIconSizeEnum.large,
        labelBuilder: (value) => value.name,
      ),
      state: context.knobs.list<DSButtonState>(
        label: localizations.styleguide_state_label,
        options: DSButtonState.values,
        initialOption: DSButtonState.normal,
        labelBuilder: (value) => value.name,
      ),
      iconPath: context.knobs.list<String>(
        label: localizations.styleguide_trailingIconPath_label,
        options: _iconOptions,
        initialOption: _iconOptions.first,
        labelBuilder: _iconLabelBuilder,
      ),
      onPressed: () {},
    ),
  );
}
