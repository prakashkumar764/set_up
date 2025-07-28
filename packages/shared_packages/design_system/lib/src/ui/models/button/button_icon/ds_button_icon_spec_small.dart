import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec.dart';
import 'package:design_system/theme/dimensions/radius.dart';
import 'package:design_system/theme/dimensions/size.dart';

class DSButtonIconSpecSmall {
  static const DSButtonIconSpec mobile = DSButtonIconSpec(
    size: DSSize.sz600,
    iconSize: DSSize.sz400,
    borderRadius: DSRadius.rd200,
    borderWidth: 1.0,
    buttonPadding: 8,
    loadingIconPadding: 2.67,
  );

  static const DSButtonIconSpec tablet = DSButtonIconSpec(
    size: 36,
    iconSize: 20,
    borderRadius: DSRadius.rd200,
    borderWidth: 1.0,
    buttonPadding: 8,
    loadingIconPadding: 2.67,
  );
}
