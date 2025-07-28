import 'package:design_system/src/ui/models/carousel/ds_carousel_spec.dart';
import 'package:design_system/src/ui/models/checkbox/ds_checkbox_spec.dart';
import 'package:design_system/src/ui/models/checklist/ds_checklist_spec.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DesignSystemUtil {
  DesignSystemUtil._();

  static final DesignSystemUtil _instance = DesignSystemUtil._();

  factory DesignSystemUtil() => _instance;

  ///Check the device is Tablet or not
  bool isTablet({double size = 0}) {
    if (size == 0.0) {
      size =
          MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single,
          ).size.shortestSide;
    }
    return size >= 650;
  }

  bool isSvgImage({required String path}) {
    return path.toLowerCase().endsWith('.svg');
  }

  static DSCheckboxSpec getDSCheckboxSizeSpec() {
    return DSCheckboxSpec(size: DesignSystemUtil().isTablet() ? 24 : 20);
  }

  static DSChecklistSpec getDSChecklistSizeSpec() {
    return DSChecklistSpec(size: DesignSystemUtil().isTablet() ? 28 : 24);
  }

  final DsToggleSpec _dsToggleSpecMobile = DsToggleSpec(
    height: 20,
    width: 40,
    thumbRadius: 8,
    borderRadius: 16,
    padding: EdgeInsets.all(2),
  );
  final DsToggleSpec _dsToggleSpecTablet = DsToggleSpec(
    height: 32,
    width: 64,
    thumbRadius: 12,
    borderRadius: 24,
    padding: EdgeInsets.all(4),
  );

  DsToggleSpec getDSToggleSizeSpec() {
    return DesignSystemUtil().isTablet()
        ? _dsToggleSpecTablet
        : _dsToggleSpecMobile;
  }

  final DsCarouselIndicatorSpec _dsCarouselIndicatorSpecMobile =
      DsCarouselIndicatorSpec(
        selectedWidth: DSSize.sz500,
        unSelectedWidth: DSSize.sz200,
        height: DSSize.sz200,
        padding: EdgeInsets.all(DSSpacing.sp100),
        margin: EdgeInsets.symmetric(horizontal: DSSpacing.sp100),
      );
  final DsCarouselIndicatorSpec _dsCarouselIndicatorSpecTablet =
      DsCarouselIndicatorSpec(
        selectedWidth: DSSize.sz600,
        unSelectedWidth: DSSize.sz300,
        height: DSSize.sz300,
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.symmetric(horizontal: 4),
      );

  DsCarouselIndicatorSpec getDSCarouselIndicatorSizeSpec() {
    return DesignSystemUtil().isTablet()
        ? _dsCarouselIndicatorSpecTablet
        : _dsCarouselIndicatorSpecMobile;
  }
}
