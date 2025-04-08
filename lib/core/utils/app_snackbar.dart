import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AlertType { success, error, warning, info, internalInfo }

/// Represents the AppSnackbar class, which encapsulates its respective functionality.
class AppSnackbar {
/// Defines `Colors.green`, a constant/variable used within the application.
  static const Color _successColor = Colors.green;
/// Defines `Colors.red`, a constant/variable used within the application.
  static final Color _errorColor = Colors.red;
/// Defines `Colors.yellow.shade700`, a constant/variable used within the application.
  static final Color _warningColor = Colors.yellow.shade700;
/// Defines `Colors.blue.shade900`, a constant/variable used within the application.
  static final Color _infoColor = Colors.blue.shade900;
/// Defines `Color(0xff949494)`, a constant/variable used within the application.
  static const Color _internalInfo = Color(0xff949494);

  static showSnackbar(
    String title,
    String message,
    AlertType altType, {
    bool dismissible = true,
    SnackPosition position = SnackPosition.TOP,
    double overlayBlur = 0,
    Duration duration = const Duration(seconds: 3),
    Function? onButtonPressed,
    String buttonTitle = "OK",
  }) {
    Color backgroundColor;
    Color textColor = Colors.white;

    switch (altType) {
      case AlertType.success:
        backgroundColor = _successColor;
        break;
      case AlertType.error:
        backgroundColor = _errorColor;
        break;
      case AlertType.warning:
        backgroundColor = _warningColor;
        textColor = Colors.black;
        break;
      case AlertType.info:
        backgroundColor = _infoColor;
        break;

      case AlertType.internalInfo:
        backgroundColor = _internalInfo;
        break;
    }

    Get.snackbar(
      title,
      message,
      colorText: textColor,
      isDismissible: dismissible,
      backgroundColor: backgroundColor,
      snackPosition: position,
      duration: duration,
      overlayBlur: overlayBlur,
      onTap: (barObject) {},
      titleText: Text(
        title,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 14, color: textColor),
      ),
      mainButton: onButtonPressed != null
          ? TextButton(
              onPressed: () {},
              child: Text(
                buttonTitle,
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            )
          : null,
    );
  }
}