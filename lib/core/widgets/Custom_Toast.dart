import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/resources/color_manager.dart';

// ignore: non_constant_identifier_names
Future<void> show_custom_toast(String msg, Color color) async {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: ColorManager.whiteColor,
      fontSize: 16.0);
}
