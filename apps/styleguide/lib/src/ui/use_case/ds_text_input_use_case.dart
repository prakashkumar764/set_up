import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:styleguide/src/util/styleguide_utils.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

final _iconsMap = StyleguideUtils().getIconsNamePathMap();
final _iconOptions = _iconsMap.values.toList();
String _iconLabelBuilder(value) =>
    _iconsMap.keys.firstWhere((key) => _iconsMap[key] == value);

@UseCase(name: 'Full Configuration', type: DSTextInput)
Widget buildDSTextInputUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;
  final label = context.knobs.string(label: 'label', initialValue: 'Label');
  final caption = context.knobs.string(
    label: localizations.styleguide_caption_label,
    initialValue: localizations.styleguide_caption_value,
  );
  final hintText = context.knobs.string(
    label: localizations.styleguide_hintText_label,
    initialValue: localizations.styleguide_hintOrInputText_value,
  );
  final leadingIconPath = context.knobs.listOrNull<String>(
    label: localizations.styleguide_leadingIconPath_label,
    options: _iconOptions,
    labelBuilder: _iconLabelBuilder,
  );
  final trailingIconPath = context.knobs.listOrNull<String>(
    label: localizations.styleguide_trailingIconPath_label,
    options: _iconOptions,
    labelBuilder: _iconLabelBuilder,
  );
  final enabled = context.knobs.boolean(
    label: localizations.styleguide_enabled_label,
    initialValue: true,
  );

  final maxLines = context.knobs.intOrNull.input(
    label: localizations.styleguide_maxLines_label,
    initialValue: 1,
  );

  final state = context.knobs.list<DSTextInputState>(
    label: localizations.styleguide_state_label,
    options: DSTextInputState.values,
    initialOption: DSTextInputState.defaultState,
    labelBuilder: (value) => value.name,
  );

  final size = context.knobs.list<DSTextInputSize>(
    label: localizations.styleguide_size_label,
    options: DSTextInputSize.values,
    initialOption: DSTextInputSize.large,
    labelBuilder: (value) => value.name,
  );

  final keyboardType = context.knobs.listOrNull<TextInputType>(
    label: localizations.styleguide_keyboardType_label,
    options: TextInputType.values,
    initialOption: null,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: DSTextInput(
        label: label.isNotEmpty ? label : null,
        caption: caption.isNotEmpty ? caption : null,
        hintText: hintText.isNotEmpty ? hintText : null,
        leadingIconPath: leadingIconPath,
        trailingIconPath: trailingIconPath,
        enabled: enabled,
        state: state,
        size: size,
        keyboardType: keyboardType,
        maxLines: maxLines,
      ),
    ),
  );
}
