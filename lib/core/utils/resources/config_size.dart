import 'package:flutter/material.dart';

class ConfigSize {
  static double? screenHeight;
  static double? screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
  }
}

// breakpoints
T bp<T>(T xs, {T? sm, T? md, T? lg, T? xl}) {
  if (ConfigSize.screenWidth! > 1200 && xl != null) return xl as T;
  if (ConfigSize.screenWidth! > 992 && lg != null) return lg as T;
  if (ConfigSize.screenWidth! > 768 && md != null) return md as T;
  if (ConfigSize.screenWidth! > 576 && sm != null) return sm as T;
  return xs;
}

bool isMobile() {
  return ConfigSize.screenWidth! < 576;
}

bool isDesktop() {
  return ConfigSize.screenWidth! > 576;
}
