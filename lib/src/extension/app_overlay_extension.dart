import 'package:flutter/material.dart';

import '../src.dart';

extension AppOverlayExtension on BuildContext {
  void show({
    String message = '',
    AppOverlayType type = AppOverlayType.loading,
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
