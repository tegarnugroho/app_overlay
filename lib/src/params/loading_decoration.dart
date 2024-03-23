import 'package:flutter/material.dart';

class LoadingDecoration {
  final double size;
  final Color secondaryColor;
  final Color primaryColor;
  final int lapDuration;
  final double strokeWidth;
  final Widget insideLoaderWidget;

  LoadingDecoration({
    this.size = 180,
    this.secondaryColor = Colors.white,
    this.primaryColor = Colors.green,
    this.lapDuration = 1000,
    this.strokeWidth = 14,
    this.insideLoaderWidget = const SizedBox.shrink(),
  });

  LoadingDecoration copyWith({
    double? size,
    Color? secondaryColor,
    Color? primaryColor,
    int? lapDuration,
    double? strokeWidth,
    Widget? insideLoaderWidget,
  }) {
    return LoadingDecoration(
      size: size ?? this.size,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryColor: primaryColor ?? this.primaryColor,
      lapDuration: lapDuration ?? this.lapDuration,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      insideLoaderWidget: insideLoaderWidget ?? this.insideLoaderWidget,
    );
  }
}
