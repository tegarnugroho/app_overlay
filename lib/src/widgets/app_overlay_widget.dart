import 'package:flutter/material.dart';

import '../params/params.dart';
import 'circular_progress.dart';

class AppOverlayWidget extends StatelessWidget {
  final OverlayAnimationParams params;
  final LoadingDecoration loadingDecoration;
  final Widget successWidget;
  final Widget errorWidget;
  const AppOverlayWidget({
    super.key,
    required this.params,
    required this.loadingDecoration,
    required this.successWidget,
    required this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (params.type == OverlayAnimationType.none) {
      return const SizedBox.shrink();
    } else if (params.type == OverlayAnimationType.custom) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: params.customWidget,
      );
    }

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          _animationBuilder(),
          _labelBuilder(),
          params.footer,
        ],
      ),
    );
  }

  Widget _animationBuilder() {
    return Container(
      width: 230,
      height: 230,
      margin: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: params.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Builder(
        builder: (context) => switch (params.type) {
          OverlayAnimationType.loading =>
            CircularProgress(loadingDecoration: loadingDecoration),
          OverlayAnimationType.error => errorWidget,
          OverlayAnimationType.success => successWidget,
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }

  Widget _labelBuilder() {
    return Builder(
      builder: (context) {
        String message = params.message;

        return Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        );
      },
    );
  }
}
