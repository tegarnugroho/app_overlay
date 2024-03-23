import 'package:flutter/material.dart';

import '../src.dart';

extension AppOverlayExtension on BuildContext {
  Future<void> show({
    String message = '',
    AppOverlayType type = AppOverlayType.loading,
    Widget footer = const SizedBox.shrink(),
    Color? backgroundColor,
    Widget customWidget = const SizedBox.shrink(),
  }) async {
    AppOverlay.show(
      message: message,
      type: type,
      footer: footer,
      backgroundColor: backgroundColor,
      customWidget: customWidget,
    );
  }

  Future<void> hide({int delayInSecond = 2}) async {
    AppOverlay.hide(delayInSecond: delayInSecond);
  }
}
