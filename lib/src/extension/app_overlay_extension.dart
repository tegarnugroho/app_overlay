import 'package:flutter/material.dart';

import '../src.dart';

extension OverlayAnimationExtension on BuildContext {
  void show({
    String message = '',
    OverlayAnimationType type = OverlayAnimationType.loading,
    Widget footer = const SizedBox.shrink(),
    Color? backgroundColor,
    Widget customWidget = const SizedBox.shrink(),
  }) {
    AppOverlay.show(
      this,
      message: message,
      type: type,
      footer: footer,
      backgroundColor: backgroundColor,
      customWidget: customWidget,
    );
  }

  void hide({int delayInSecond = 2}) {
    AppOverlay.hide(delayInSecond: delayInSecond);
  }
}
