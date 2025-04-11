import 'package:flutter/material.dart';
import 'package:lurichmaxble/core/constants/app_colors.dart';

class ValidationInputTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool isObsecure;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;

  const ValidationInputTextField({
    super.key,
    this.controller,
    this.isObsecure = false,
    this.suffixWidget,
    required this.hintText,
    this.keyboardType,
    this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xffd6d6d6)),
        suffixIcon: suffixWidget,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 0.1,
            width: 1,
            color: AppColors.inputBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
        ),
      ),
      validator: validator,
    );
  }
}

// Email Validator
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

// Password Validator
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  } else if (value.length != 10) {
    return "Phone Number must be 10 Digits";
  } else if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
    return 'Enter a valid phone number';
  }
  return null;
}
