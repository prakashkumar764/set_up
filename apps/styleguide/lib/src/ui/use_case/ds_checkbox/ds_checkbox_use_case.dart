import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

@UseCase(name: 'ds_checkbox_use_case', type: DSCheckbox)
Widget buildDSCheckboxUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;

  final initialState = context.knobs.list<DSCheckboxState>(
    label: localizations.styleguide_state_label,
    options: DSCheckboxState.values,
    initialOption: DSCheckboxState.unSelected,
    labelBuilder: (value) => value.name,
  );

  final isDisabled = context.knobs.boolean(
    label: localizations.styleguide_disabled_label,
    initialValue: false,
  );

  final labelText = context.knobs.string(
    label: localizations.styleguide_checkbox_label,
    initialValue: localizations.styleguide_checkbox_label,
  );

  return StatefulBuilder(
    builder: (context, setState) {
      DSCheckboxState currentState = initialState;

      return Center(
        child: DSCheckbox(
          state: currentState,
          disabled: isDisabled,
          label: labelText,
          onChanged: (newState) {
            setState(() {
              currentState = newState;
            });
          },
        ),
      );
    },
  );
}
