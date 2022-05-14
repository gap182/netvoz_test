import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.labelStyle,
    this.suffixIcon,
    this.textInputType,
  }) : super(key: key);

  final String? label;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(label ?? ""),
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.only(left: 20.w, top: 35.h),
      ),
    );
  }
}
