import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

enum DSTextStyleType {
  primaryHeadingXxl(
    mobileTextStyle: DSTextStyles.primaryHeadingXxl,
    tabletTextStyle: DSTextStyles.primaryHeadingXxl,
  ),
  primaryHeadingXl(
    mobileTextStyle: DSTextStyles.primaryHeadingXl,
    tabletTextStyle: DSTextStyles.primaryHeadingXl,
  ),
  primaryHeadingL(
    mobileTextStyle: DSTextStyles.primaryHeadingL,
    tabletTextStyle: DSTextStyles.primaryHeadingL,
  ),
  primaryHeadingM(
    mobileTextStyle: DSTextStyles.primaryHeadingM,
    tabletTextStyle: DSTextStyles.primaryHeadingM,
  ),
  primaryHeadingS(
    mobileTextStyle: DSTextStyles.primaryHeadingS,
    tabletTextStyle: DSTextStyles.primaryHeadingS,
  ),
  primarySubHeadingM(
    mobileTextStyle: DSTextStyles.primarySubheadingM,
    tabletTextStyle: DSTextStyles.primarySubheadingM,
  ),
  primarySubHeadingS(
    mobileTextStyle: DSTextStyles.primarySubheadingS,
    tabletTextStyle: DSTextStyles.primarySubheadingS,
  ),
  primaryBodyMRegular(
    mobileTextStyle: DSTextStyles.primaryBodyMRegular,
    tabletTextStyle: DSTextStyles.primaryBodyMRegular,
  ),
  primaryBodyMMedium(
    mobileTextStyle: DSTextStyles.primaryBodyMMedium,
    tabletTextStyle: DSTextStyles.primaryBodyMMedium,
  ),
  primaryBodySRegular(
    mobileTextStyle: DSTextStyles.primaryBodySRegular,
    tabletTextStyle: DSTextStyles.primaryBodySRegular,
  ),
  primaryBodySMedium(
    mobileTextStyle: DSTextStyles.primaryBodySMedium,
    tabletTextStyle: DSTextStyles.primaryBodySMedium,
  ),
  primaryCaption(
    mobileTextStyle: DSTextStyles.primaryCaptionSRegular,
    tabletTextStyle: DSTextStyles.primaryCaptionSRegular,
  ),
  primaryCaptionSemibold(
    mobileTextStyle: DSTextStyles.primaryCaptionSMedium,
    tabletTextStyle: DSTextStyles.primaryCaptionSMedium,
  ),
  primaryButtonLMedium(
    mobileTextStyle: DSTextStyles.primaryButtonLMedium,
    tabletTextStyle: DSTextStyles.primaryButtonLMedium,
  ),
  primaryButtonLRegular(
    mobileTextStyle: DSTextStyles.primaryButtonLRegular,
    tabletTextStyle: DSTextStyles.primaryButtonLRegular,
  ),
  primaryButtonSMedium(
    mobileTextStyle: DSTextStyles.primaryButtonSMedium,
    tabletTextStyle: DSTextStyles.primaryButtonSMedium,
  ),
  primaryButtonSRegular(
    mobileTextStyle: DSTextStyles.primaryButtonSRegular,
    tabletTextStyle: DSTextStyles.primaryButtonSRegular,
  ),
  primaryLinkM(
    mobileTextStyle: DSTextStyles.primaryLinkM,
    tabletTextStyle: DSTextStyles.primaryLinkM,
  ),
  primaryLinkS(
    mobileTextStyle: DSTextStyles.primaryLinkS,
    tabletTextStyle: DSTextStyles.primaryLinkS,
  ),
  primaryNavigationXs(
    mobileTextStyle: DSTextStyles.primaryNavigationXs,
    tabletTextStyle: DSTextStyles.primaryNavigationXs,
  ),
  secondaryHeadingXl(
    mobileTextStyle: DSTextStyles.secondaryHeadingXl,
    tabletTextStyle: DSTextStyles.secondaryHeadingXl,
  ),
  secondaryHeadingL(
    mobileTextStyle: DSTextStyles.secondaryHeadingL,
    tabletTextStyle: DSTextStyles.secondaryHeadingL,
  ),
  secondaryHeadingM(
    mobileTextStyle: DSTextStyles.secondaryHeadingM,
    tabletTextStyle: DSTextStyles.secondaryHeadingM,
  ),
  secondaryHeadingS(
    mobileTextStyle: DSTextStyles.secondaryHeadingS,
    tabletTextStyle: DSTextStyles.secondaryHeadingS,
  ),
  secondaryHeadingXS(
    mobileTextStyle: DSTextStyles.secondaryHeadingXs,
    tabletTextStyle: DSTextStyles.secondaryHeadingXs,
  );

  final TextStyle mobileTextStyle;
  final TextStyle tabletTextStyle;

  const DSTextStyleType({
    required this.mobileTextStyle,
    required this.tabletTextStyle,
  });

  TextStyle getTextStyle() {
    final isTablet = DesignSystemUtil().isTablet();
    return isTablet ? tabletTextStyle : mobileTextStyle;
  }
}
