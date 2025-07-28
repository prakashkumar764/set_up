import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

@UseCase(name: 'ds_checklist_selector_use_case', type: DSChecklistSelector)
Widget buildDSChecklistSelectorUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;

  final initialState = context.knobs.list<DSChecklistState>(
    label: localizations.styleguide_state_label,
    options: DSChecklistState.values,
    initialOption: DSChecklistState.unSelected,
    labelBuilder: (value) => value.name,
  );

  final borderWidth = context.knobs.doubleOrNull.input(
    label: localizations.styleguide_border_width_label,
    initialValue: 2.0,
  );

  final iconPadding = context.knobs.doubleOrNull.input(
    label: localizations.styleguide_icon_padding_label,
    initialValue: 2.0,
  );

  return StatefulBuilder(
    builder: (context, setState) {
      var currentState = initialState;

      return Center(
        child: DSChecklistSelector(
          state: currentState,
          borderWidth: borderWidth,
          iconPadding: iconPadding,
          onTap: () {
            setState(() {
              currentState = currentState == DSChecklistState.selected
                  ? DSChecklistState.unSelected
                  : DSChecklistState.selected;
            });
          },
        ),
      );
    },
  );
}
