import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'DSToggle', type: DSToggle)
Widget buildDSToggleUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;
  String? getLabelText() {
    return context.knobs.string(
      label: localizations.styleguide_toggle_label,
      initialValue: localizations.styleguide_toggle_value,
    );
  }

  return DSToggle(
    value: context.knobs.boolean(
      label: localizations.styleguide_toggleState_label,
      initialValue: true,
    ),
    enabled: context.knobs.boolean(
      label: localizations.styleguide_toggle_enabled,
      initialValue: true,
    ),
    label: getLabelText(),
    onChanged: (value) {},
  );
}
