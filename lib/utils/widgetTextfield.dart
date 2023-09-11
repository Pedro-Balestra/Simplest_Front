import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColors.dart';

Widget textFieldContainer(label, keyboard, key) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.textFieldColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    width: double.infinity,
    height: 60,
    child: TextField(
      controller: key,
      decoration: InputDecoration(
        labelText: "$label:",
        hintStyle: GoogleFonts.poppins(
            color: AppColors.textFieldTextColor, fontSize: 15),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(
          left: 34,
          top: 5,
        ),
      ),
      keyboardType: keyboard,
    ),
  );
}
