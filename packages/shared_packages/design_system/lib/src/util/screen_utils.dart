import 'package:flutter/material.dart';

class ScreenUtil {
  ScreenUtil._();

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double widthPct(BuildContext context, double percent) =>
      width(context) * percent;

  static double heightPct(BuildContext context, double percent) =>
      height(context) * percent;
}
