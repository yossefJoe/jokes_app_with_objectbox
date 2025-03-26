import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color? color;
  final Color? textColor;
  final bool? isPressed;
  final double? width;
  final double? height;

  const MainButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.textColor,
    this.isPressed = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 50.h,
        decoration: BoxDecoration(
          color: color ?? ColorManager.mainColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isPressed == true
              ? const Center(
                  child: const CircularProgressIndicator(
                    color: ColorManager.mainColor,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
