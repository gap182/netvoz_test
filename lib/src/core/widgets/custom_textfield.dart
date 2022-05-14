import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.labelStyle,
    this.suffixIcon,
    this.textInputType,
    this.errorText,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  final String? label;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final String? errorText;
  final bool obscureText;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(label ?? ""),
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.only(left: 20.w, top: 35.h),
      ),
    );
  }
}
