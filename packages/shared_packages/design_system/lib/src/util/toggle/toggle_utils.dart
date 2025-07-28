import 'package:design_system/src/ui/models/toggle/ds_toggle_state.dart';
import 'package:design_system/src/ui/models/toggle/ds_toggle_status.dart';
import 'package:design_system/src/ui/models/toggle/ds_toggle_colors.dart';
import 'package:design_system/theme/theme_data/color_theme_extension.dart';

class ToggleUtils {
  ToggleUtils._();

  static final ToggleUtils _instance = ToggleUtils._();

  factory ToggleUtils() => _instance;

  DSToggleColors getToggleStyle({
    required DSToggleState state,
    required DSToggleStatus status,
    required DSColorThemeExtension dsColor,
  }) {
    if (state == DSToggleState.normal && status == DSToggleStatus.on) {
      return DSToggleColors(
        backgroundColor: dsColor.surfacePrimaryDefault,
        thumbColor: dsColor.iconOnSurfaceDefault,
        labelTextColor: dsColor.textNeutralOnWhite,
      );
    } else if (state == DSToggleState.normal && status == DSToggleStatus.off) {
      return DSToggleColors(
        backgroundColor: dsColor.surfaceNeutralContainer5,
        thumbColor: dsColor.iconOnSurfaceDefault,
        labelTextColor: dsColor.textNeutralOnWhite,
      );
    } else if (state == DSToggleState.disabled && status == DSToggleStatus.on) {
      return DSToggleColors(
        backgroundColor: dsColor.surfacePrimaryDisabled,
        thumbColor: dsColor.iconOnSurfaceDefault,
        labelTextColor: dsColor.textNeutralOnWhite,
      );
    }
    return DSToggleColors(
      backgroundColor: dsColor.surfaceNeutralDisabled,
      thumbColor: dsColor.iconNeutralDisabled,
      labelTextColor: dsColor.textNeutralDisabled,
    );
  }
}
