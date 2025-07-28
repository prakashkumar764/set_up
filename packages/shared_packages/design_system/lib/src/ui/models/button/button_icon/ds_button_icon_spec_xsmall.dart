import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec.dart';
import 'package:design_system/theme/dimensions/radius.dart';
import 'package:design_system/theme/dimensions/size.dart';

class DSButtonIconSpecXSmall {
  static const DSButtonIconSpec mobile = DSButtonIconSpec(
    size: DSSize.sz500,
    iconSize: DSSize.sz400,
    borderRadius: DSRadius.rd200,
    borderWidth: 1.0,
    loadingIconPadding: 2.67,
    buttonPadding: 4,
  );

  static const DSButtonIconSpec tablet = DSButtonIconSpec(
    size: 28,
    iconSize: 20,
    borderRadius: DSRadius.rd200,
    borderWidth: 1.0,
    buttonPadding: 4,
    loadingIconPadding: 2.67,
  );
}
