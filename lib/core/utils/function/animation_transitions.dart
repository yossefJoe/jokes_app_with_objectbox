import 'package:flutter/material.dart';

class AnimationTransitions {
  static Widget slideTransition(
      BuildContext context, Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Widget fadeTransition(
      BuildContext context, Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static Widget scaleTransition(
      BuildContext context, Animation<double> animation, Widget child) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  static Widget rotationTransition(
      BuildContext context, Animation<double> animation, Widget child) {
    return RotationTransition(
      turns: animation,
      child: child,
    );
  }
}
