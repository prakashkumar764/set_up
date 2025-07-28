import 'package:design_system/src/ui/models/text_input/ds_text_input_spec_large.dart';
import 'package:design_system/src/ui/models/text_input/ds_text_input_spec.dart';
import 'package:design_system/src/ui/models/text_input/ds_text_input_spec_small.dart';

enum DSTextInputSize {
  large(
    dsTextInputSpecMobile: DSTextInputSpecLarge.mobile,
    dsTextInputSpecTablet: DSTextInputSpecLarge.tablet,
  ),
  small(
    dsTextInputSpecMobile: DSTextInputSpecSmall.mobile,
    dsTextInputSpecTablet: DSTextInputSpecSmall.tablet,
  );

  final DSTextInputSpec dsTextInputSpecMobile;
  final DSTextInputSpec dsTextInputSpecTablet;

  const DSTextInputSize({
    required this.dsTextInputSpecMobile,
    required this.dsTextInputSpecTablet,
  });

  DSTextInputSpec getTextInputSizeSpec({required bool isTablet}) {
    return isTablet ? dsTextInputSpecTablet : dsTextInputSpecMobile;
  }
}
