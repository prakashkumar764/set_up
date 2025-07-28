import 'dart:io';
import 'dart:typed_data';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DSImage extends StatelessWidget {
  final String path;
  final Uint8List? uint8list;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final Widget? errorWidget;
  //loadingBuilder and placeholderBuilder use same widget
  final Widget? placeholder;
  final DSImageType _type;

  const DSImage._internal({
    required this.path,
    required DSImageType type,
    this.width,
    this.uint8list,
    this.height,
    this.fit = BoxFit.fill,
    this.color,
    this.errorWidget,
    this.placeholder,
    super.key,
  }) : _type = type;

  factory DSImage.asset(
    String path, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    Color? color,
    Widget? errorWidget,
    Widget? placeholder,
  }) {
    return DSImage._internal(
      path: path,
      type: DSImageType.asset,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorWidget: errorWidget,
      placeholder: placeholder,
      key: key,
    );
  }

  factory DSImage.network(
    String path, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    Color? color,
    Widget? errorWidget,
    Widget? placeholder,
  }) {
    return DSImage._internal(
      path: path,
      type: DSImageType.network,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorWidget: errorWidget,
      placeholder: placeholder,
      key: key,
    );
  }

  factory DSImage.file(
    String path, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    Color? color,
    Widget? errorWidget,
    Widget? placeholder,
  }) {
    return DSImage._internal(
      path: path,
      type: DSImageType.file,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorWidget: errorWidget,
      placeholder: placeholder,
      key: key,
    );
  }

  factory DSImage.memory({
    required Uint8List uint8list,
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    Color? color,
    Widget? errorWidget,
    Widget? placeholder,
  }) {
    return DSImage._internal(
      path: "",
      uint8list: uint8list,
      type: DSImageType.memory,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorWidget: errorWidget,
      placeholder: placeholder,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case DSImageType.network:
        return DesignSystemUtil().isSvgImage(path: path)
            ? SvgPicture.network(
              path,
              width: width,
              height: height,
              fit: fit,
              colorFilter:
                  color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
              placeholderBuilder:
                  placeholder != null ? (_) => placeholder! : null,
              errorBuilder:
                  errorWidget != null ? (_, __, ___) => errorWidget! : null,
            )
            : Image.network(
              path,
              width: width,
              height: height,
              fit: fit,
              color: color,
              loadingBuilder:
                  placeholder != null
                      ? (context, child, loadingProgress) =>
                          loadingProgress == null ? child : placeholder!
                      : null,
              errorBuilder:
                  errorWidget != null ? (_, __, ___) => errorWidget! : null,
            );
      case DSImageType.file:
        final dynamic file = File(path);
        return DesignSystemUtil().isSvgImage(path: path)
            ? SvgPicture.file(
              file,
              width: width,
              height: height,
              fit: BoxFit.contain,
              colorFilter:
                  color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
              placeholderBuilder:
                  placeholder != null ? (_) => placeholder! : null,
              errorBuilder:
                  errorWidget != null ? (_, __, ___) => errorWidget! : null,
            )
            : Image.file(
              file,
              width: width,
              height: height,
              fit: fit,
              color: color,
              errorBuilder:
                  errorWidget != null ? (_, __, ___) => errorWidget! : null,
            );
      case DSImageType.asset:
        return DesignSystemUtil().isSvgImage(path: path)
            ? SvgPicture.asset(
              path,
              width: width,
              height: height,
              fit: fit,
              colorFilter:
                  color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
              placeholderBuilder:
                  placeholder != null ? (_) => placeholder! : null,
              errorBuilder:
                  errorWidget != null ? (_, __, ___) => errorWidget! : null,
            )
            : Image.asset(
              path,
              width: width,
              height: height,
              fit: fit,
              color: color,
              errorBuilder:
                  errorWidget != null ? (_, __, ___) => errorWidget! : null,
            );
      case DSImageType.memory:
        return Image.memory(
          uint8list!,
          width: width,
          height: height,
          fit: fit,
          errorBuilder:
              errorWidget != null ? (_, __, ___) => errorWidget! : null,
        );
    }
  }
}
