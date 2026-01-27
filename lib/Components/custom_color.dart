import 'package:flutter/material.dart';

class CustomColor {
  static const Color bluePrimary = Color(0xFF4365FF);
  static const Color blueSecondary = Color(0xFF1F41BB);
  static const Color whiteShadows = Color.fromARGB(7, 133, 157, 242);
  static const Color blue = Color.fromARGB(255, 120, 188, 255);
  static const Color blugrey = Color.fromARGB(255, 176, 190, 197);
  static const Color orange = Colors.amber;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFEDF6FF);
  static const Color Circle2 = Color(0xFFF2FEFF);
  static const Color warmGrey = Color(0xFFF0F0F0);
  static const Color grey = Color(0x19F7F9FF);
  static const Color elementInactive1 = Colors.black54;
  static const Color elementInactive2 = Colors.black26;
  static const Color primary = Color(0xFFC04848);
  static const Color primaryLight = Color(0xFFD86B6B);
  static const Color primaryDark = Color(0xFFA03838);
  static const Color greyBackground = Color(0xFFF5F5F5);
  static const Color cardBackground = Colors.white;
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Colors.white;
  static const Color textBlack = Color(0xFF000000);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color shadow = Color(0x1A000000);
  static const Color border = Color(0xFFE0E0E0);
}

TextStyle fontColor(
  Color color, {
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

class CustomTextStyle {
  static TextStyle heading1({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle heading2({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle heading3({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle bodyLarge({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }
  static TextStyle bodyMedium({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }
  static TextStyle bodySmall({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }
  static TextStyle caption({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textSecondary,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    );
  }
  static TextStyle button({Color? color}) {
    return TextStyle(
      color: color ?? CustomColor.textWhite,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}