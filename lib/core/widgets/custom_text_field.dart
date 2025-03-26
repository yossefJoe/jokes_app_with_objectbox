import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? suffix;
  final TextInputType inputType;
  final bool obscureText;
  final String? hint;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;

  CustomTextField({
    super.key,
    required this.controller,
    this.suffix,
    required this.inputType,
    this.obscureText = false,
    this.hint,
    this.validator,
    this.focusNode,
    this.inputFormatters,
    this.prefix,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    isPasswordVisible =
        !widget.obscureText; // Set initial state based on obscureText
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        inputFormatters: widget.inputFormatters ?? [],
        focusNode: widget.focusNode,
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText ? !isPasswordVisible : false,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: ColorManager.greylight,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
          prefixIcon: widget.prefix,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                )
              : widget.suffix,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1,
              color: ColorManager.mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFD3D3D3),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFD3D3D3),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1,
              color: ColorManager.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1,
              color: ColorManager.red,
            ),
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
