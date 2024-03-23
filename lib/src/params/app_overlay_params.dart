import 'package:flutter/material.dart';

enum AppOverlayType { none, loading, success, error, custom }

class AppOverlayParams {
  final String message;
  final Widget footer;
  final AppOverlayType type;
  final Color backgroundColor;
  final Widget customWidget;

  const AppOverlayParams({
    this.message = '',
    this.type = AppOverlayType.loading,
    this.backgroundColor = Colors.white,
    this.footer = const SizedBox.shrink(),
    this.customWidget = const SizedBox.shrink(),
  });

  AppOverlayParams copyWith({
    String? message,
    Widget? footer,
    AppOverlayType? type,
    Color? backgroundColor,
    double? copyWidth,
    Widget? customWidget,
  }) {
    return AppOverlayParams(
      message: message ?? this.message,
      type: type ?? this.type,
      footer: footer ?? this.footer,
      customWidget: customWidget ?? this.customWidget,
    );
  }
}
