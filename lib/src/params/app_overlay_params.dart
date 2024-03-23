import 'package:flutter/material.dart';

enum OverlayAnimationType { none, loading, success, error, custom }

class OverlayAnimationParams {
  final String message;
  final Widget footer;
  final OverlayAnimationType type;
  final Color backgroundColor;
  final Widget customWidget;

  const OverlayAnimationParams({
    this.message = '',
    this.type = OverlayAnimationType.loading,
    this.backgroundColor = Colors.white,
    this.footer = const SizedBox.shrink(),
    this.customWidget = const SizedBox.shrink(),
  });

  OverlayAnimationParams copyWith({
    String? message,
    Widget? footer,
    OverlayAnimationType? type,
    Color? backgroundColor,
    double? copyWidth,
    Widget? customWidget,
  }) {
    return OverlayAnimationParams(
      message: message ?? this.message,
      type: type ?? this.type,
      footer: footer ?? this.footer,
      customWidget: customWidget ?? this.customWidget,
    );
  }
}
