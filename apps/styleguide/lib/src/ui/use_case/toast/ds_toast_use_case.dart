import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:styleguide/l10n/styleguide_localizations.dart';
import 'package:styleguide/src/util/styleguide_utils.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

final _iconsMap = StyleguideUtils().getIconsNamePathMap();
final _iconOptions = _iconsMap.values.toList();

String _iconLabelBuilder(value) =>
    _iconsMap.keys.firstWhere((key) => _iconsMap[key] == value);

@UseCase(name: 'DSToast', type: DSToast)
Widget buildDSToastUseCase(BuildContext context) {
  final localizations = StyleguideLocalizations.of(context)!;
  final hasButton = context.knobs.boolean(
    label: localizations.styleguide_hasButton_label,
    initialValue: false,
  );
  return DSToast(
    title: context.knobs.string(
      label: localizations.styleguide_toast_label,
      initialValue: localizations.styleguide_toast_initialText,
    ),
    caption: context.knobs.stringOrNull(
      label: localizations.styleguide_caption_label,
      initialValue: localizations.styleguide_caption_value,
    ),
    leadingIconPath: context.knobs.listOrNull<String>(
      label: localizations.styleguide_leadingIconPath_label,
      options: _iconOptions,
      initialOption: null,
      labelBuilder: _iconLabelBuilder,
    ),
    showClose: context.knobs.boolean(
      label: localizations.styleguide_showCloseIcon_label,
      initialValue: true,
    ),
    toastStyle: context.knobs.list<DSToastStyle>(
      label: localizations.styleguide_toastStyle_label,
      initialOption: DSToastStyle.light,
      options: DSToastStyle.values,
      labelBuilder: (value) => value.name,
    ),
    buttonText:
        hasButton
            ? context.knobs.string(
              label: localizations.styleguide_buttonText_label,
              initialValue: localizations.styleguide_button_initialText,
            )
            : null,
    onButtonTap: hasButton ? () {} : null,
    onDismissToast: () {},
  );
}
