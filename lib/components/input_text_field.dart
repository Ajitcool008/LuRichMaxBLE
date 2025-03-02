import 'package:flutter/material.dart';
import 'package:lurichmaxble/components/app_colors.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool? isObsecure;
  final Widget? suffixWidget;
  const InputTextField(
      {super.key, required this.hintText, this.isObsecure, this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixWidget,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.inputBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 0.1,
            width: 1,
            color: AppColors.inputBorderColor,
          ),
        ),
      ),
    );
  }
}
