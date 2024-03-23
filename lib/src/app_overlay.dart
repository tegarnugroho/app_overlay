import 'package:flutter/material.dart';
import 'params/app_overlay_params.dart';
import 'params/loading_decoration.dart';
import 'widgets/app_overlay_widget.dart';

class AppOverlay {
  static final List<OverlayEntry> _overlayStack = [];
  static LoadingDecoration _defaultLoadingDecoration = LoadingDecoration();
  static Widget _errorWidget = const Icon(
    Icons.error,
    size: 200,
    color: Colors.red,
  );
  static Widget _successWidget = const Icon(
    Icons.check_circle,
    size: 200,
    color: Colors.green,
  );
  static bool _initialized = false;
  static Color _backgroundColor = Colors.white;

  static Widget init({
    required Widget child,
    Color? backgroundColor,
    LoadingDecoration? defaultLoadingDecoration,
    Widget? errorWidget,
    Widget? successWidget,
  }) {
    _defaultLoadingDecoration =
        defaultLoadingDecoration ?? _defaultLoadingDecoration;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _errorWidget = errorWidget ?? _errorWidget;
    _successWidget = successWidget ?? _successWidget;
    _initialized = true;

    return child;
  }

  static void _checkInitialized() {
    if (!_initialized) {
      throw Exception(
          'OverlayAnimation must be initialized before calling show() or hide().');
    }
  }

  static void show(
    BuildContext context, {
    String message = '',
    OverlayAnimationType type = OverlayAnimationType.loading,
    Widget footer = const SizedBox.shrink(),
    Color? backgroundColor,
    Widget customWidget = const SizedBox.shrink(),
  }) {
    _checkInitialized();

    for (var overlayEntry in _overlayStack) {
      overlayEntry.remove();
    }
    _overlayStack.clear();

    final animationParams = OverlayAnimationParams(
      message: _getMessageFromType(type),
      type: type,
      backgroundColor: backgroundColor ?? _backgroundColor,
      footer: footer,
      customWidget: customWidget,
    );

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: AppOverlayWidget(
              params: animationParams,
              loadingDecoration: _defaultLoadingDecoration,
              successWidget: _successWidget,
              errorWidget: _errorWidget,
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(overlayEntry);
    _overlayStack.add(overlayEntry);
  }

  static void hide({int delayInSecond = 2}) {
    _checkInitialized();

    if (_overlayStack.isNotEmpty) {
      final overlayEntry = _overlayStack.removeLast();
      Future.delayed(Duration(seconds: delayInSecond), () {
        overlayEntry.remove();
      });
    }
  }

  static String _getMessageFromType(OverlayAnimationType type) {
    return switch (type) {
      OverlayAnimationType.loading => 'Loading...',
      OverlayAnimationType.error => 'Error',
      OverlayAnimationType.success => 'Success',
      _ => '',
    };
  }
}
