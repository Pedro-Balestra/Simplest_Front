import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColors.dart';

Widget wtextButton(label) {
  return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textFieldTextColor,
        textStyle: GoogleFonts.poppins(fontSize: 12),
      ),
      child: Text("$label"));
}
