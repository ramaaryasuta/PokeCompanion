import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum LoadingType {
  fourRotatingDots,
  bouncingBall,
  beat,
  discreteCircle,
  dotsTriangle,
  fallingDot,
  flickr,
  halfTriangleDot,
  hexagonDots,
  horizontalRotatingDots
}

class PLoadingWidget extends StatelessWidget {
  const PLoadingWidget({super.key, this.type = LoadingType.fourRotatingDots});

  final LoadingType type;
  final color = Colors.red;
  final double size = 40;

  @override
  Widget build(BuildContext context) {
    if (type == LoadingType.bouncingBall) {
      return LoadingAnimationWidget.bouncingBall(color: color, size: size);
    }

    if (type == LoadingType.beat) {
      return LoadingAnimationWidget.beat(color: color, size: size);
    }

    if (type == LoadingType.discreteCircle) {
      return LoadingAnimationWidget.discreteCircle(color: color, size: size);
    }

    if (type == LoadingType.dotsTriangle) {
      return LoadingAnimationWidget.dotsTriangle(color: color, size: size);
    }

    if (type == LoadingType.fallingDot) {
      return LoadingAnimationWidget.fallingDot(color: color, size: size);
    }

    if (type == LoadingType.flickr) {
      return LoadingAnimationWidget.flickr(
        leftDotColor: color,
        rightDotColor: color,
        size: size,
      );
    }

    if (type == LoadingType.halfTriangleDot) {
      return LoadingAnimationWidget.halfTriangleDot(
        color: color,
        size: size,
      );
    }

    if (type == LoadingType.hexagonDots) {
      return LoadingAnimationWidget.hexagonDots(
        color: color,
        size: size,
      );
    }
    if (type == LoadingType.horizontalRotatingDots) {
      return LoadingAnimationWidget.horizontalRotatingDots(
        color: color,
        size: size,
      );
    }

    return LoadingAnimationWidget.fourRotatingDots(
      color: color,
      size: 40,
    );
  }
}
