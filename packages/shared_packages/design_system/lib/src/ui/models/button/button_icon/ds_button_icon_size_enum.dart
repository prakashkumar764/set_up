import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec.dart';
import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec_large.dart';
import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec_small.dart';
import 'package:design_system/src/ui/models/button/button_icon/ds_button_icon_spec_xsmall.dart';

enum DSButtonIconSizeEnum {
  large(
    dsButtonIconSpecMobile: DSButtonIconSpecLarge.mobile,
    dsButtonIconSpecTablet: DSButtonIconSpecLarge.tablet,
  ),
  small(
    dsButtonIconSpecMobile: DSButtonIconSpecSmall.mobile,
    dsButtonIconSpecTablet: DSButtonIconSpecSmall.tablet,
  ),
  xSmall(
    dsButtonIconSpecMobile: DSButtonIconSpecXSmall.mobile,
    dsButtonIconSpecTablet: DSButtonIconSpecXSmall.tablet,
  );

  final DSButtonIconSpec dsButtonIconSpecMobile;
  final DSButtonIconSpec dsButtonIconSpecTablet;

  const DSButtonIconSizeEnum({
    required this.dsButtonIconSpecMobile,
    required this.dsButtonIconSpecTablet,
  });

  DSButtonIconSpec getButtonIconSizeSpec({required bool isTablet}) {
    return isTablet ? dsButtonIconSpecTablet : dsButtonIconSpecMobile;
  }
}
