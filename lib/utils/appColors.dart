import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xFFB062D5);
  static Color secondaryColor = const Color(0xFFD275FF);
  static Color button = const Color(0xFF713F89);
  static Color buttonText = const Color(0xFF000000);
  static Color textFieldTextColor = const Color.fromRGBO(0, 0, 0, 0.6);
  static Color textFieldColor = const Color.fromRGBO(217, 217, 217, 0.5);
}

LinearGradient backgroundApp() {
  return LinearGradient(
    colors: [
      AppColors.primaryColor,
      AppColors.secondaryColor,
    ],
    stops: const [
      0.1,
      0.7,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
