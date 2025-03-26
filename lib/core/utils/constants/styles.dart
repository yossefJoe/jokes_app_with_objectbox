import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: ColorManager.black,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    color: ColorManager.black,
  );
  static TextStyle textStyle30 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: ColorManager.black,
  );
  static TextStyle textStyle40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
    color: ColorManager.black,
  );
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: ColorManager.black,
  );
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: ColorManager.black,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.black,
  );
}
