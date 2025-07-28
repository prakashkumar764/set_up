import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec.dart';
import 'package:design_system/theme/dimensions/radius.dart';
import 'package:design_system/theme/dimensions/size.dart';

class DSButtonIconSpecLarge {
  static const DSButtonIconSpec mobile = DSButtonIconSpec(
    size: 36,
    iconSize: 20,
    borderRadius: DSRadius.rd200,
    borderWidth: 1.0,
    buttonPadding: 8,
    loadingIconPadding: 3.33,
  );

  static const DSButtonIconSpec tablet = DSButtonIconSpec(
    size: DSSize.sz700,
    iconSize: DSSize.sz700,
    borderRadius: DSRadius.rd300,
    borderWidth: 1.0,
    buttonPadding: 8,
    loadingIconPadding: 3.33,
  );
}
