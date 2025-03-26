import 'package:flutter/material.dart';

class ColorBackGround {
  static const List<Color> colors = [
    Color(0xFF5B073A),
    Color(0xFFe2a039),
    Color(0xFF3D3D3F),
    Color(0xFFaecf55),
    Color(0xFF285B52),
    Color(0xFF36B8B1),
    Color(0xFF006735),
    Color(0xFFa9dcd9),
    Color(0xFFA9DCD9),
    Color(0xFF2F62CB),
    Color(0xFFB183C7),
    Color(0xFF938CE1),
    Color(0xFFF6A0A3),
    Color(0xFFF8F8F8),
    Color(0xFFE0DEDC),
  ];
  static Color getColor(int index) {
    return colors[index];
  }
}
