import 'package:flutter/material.dart';
import 'package:lurichmaxble/components/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  final IconData? buttonIcon;
  final double buttonWidth;
  final Color buttonColor;
  final Color buttonTextColor;
  const CommonButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.buttonIcon,
    required this.buttonWidth,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.07,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                  color: buttonTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              buttonIcon ?? null,
              color: Colors.white,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
