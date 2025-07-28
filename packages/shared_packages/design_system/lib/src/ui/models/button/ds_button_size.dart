import 'package:design_system/src/ui/models/button/ds_button_spec.dart';
import 'package:design_system/src/ui/models/button/ds_button_spec_large.dart';
import 'package:design_system/src/ui/models/button/ds_button_spec_small.dart';

enum DSButtonSize {
  large(DSButtonSpecLarge.mobile, DSButtonSpecLarge.tablet),
  small(DSButtonSpecSmall.mobile, DSButtonSpecSmall.tablet);

  final DSButtonSpec dsButtonSpecMobile;
  final DSButtonSpec dsButtonSpecTablet;

  const DSButtonSize(this.dsButtonSpecMobile, this.dsButtonSpecTablet);

  DSButtonSpec getButtonSizeSpec({required bool isTablet}) {
    return isTablet ? dsButtonSpecTablet : dsButtonSpecMobile;
  }
}
