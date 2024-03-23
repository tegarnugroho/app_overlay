import 'package:flutter/material.dart';

import '../params/params.dart';
import 'circle_paint.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({
    super.key,
    required this.loadingDecoration,
  });

  final LoadingDecoration loadingDecoration;
  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.loadingDecoration.lapDuration))
      ..repeat();
    animation = Tween<double>(begin: 0.0, end: 360.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.loadingDecoration.insideLoaderWidget,
        RotationTransition(
          turns: Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(controller),
          child: CustomPaint(
            painter: CirclePaint(
              secondaryColor: widget.loadingDecoration.secondaryColor,
              primaryColor: widget.loadingDecoration.primaryColor,
              strokeWidth: widget.loadingDecoration.strokeWidth,
            ),
            size: Size(
              widget.loadingDecoration.size,
              widget.loadingDecoration.size,
            ),
          ),
        ),
      ],
    );
  }
}
