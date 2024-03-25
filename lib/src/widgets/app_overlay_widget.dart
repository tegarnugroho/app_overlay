import 'package:flutter/material.dart';

import '../params/params.dart';
import 'circular_progress.dart';

class AppOverlayWidget extends StatelessWidget {
  final AppOverlayParams params;
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
    if (params.type == AppOverlayType.none) {
      return const SizedBox.shrink();
    } else if (params.type == AppOverlayType.custom) {
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: params.customWidget,
      );
    }

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _animationBuilder(),
              if (params.message.isNotEmpty) _labelBuilder(),
              params.footer,
            ],
          ),
        ),
      ),
    );
  }

  Widget _animationBuilder() {
    return Container(
      width: loadingDecoration.size + 35,
      height: loadingDecoration.size + 35,
      margin: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: params.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Builder(
        builder: (context) => switch (params.type) {
          AppOverlayType.loading =>
            CircularProgress(loadingDecoration: loadingDecoration),
          AppOverlayType.error => errorWidget,
          AppOverlayType.success => successWidget,
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
