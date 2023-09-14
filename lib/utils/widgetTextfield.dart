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
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      keyboardType: keyboard,
    ),
  );
}

Widget textFieldProfile(keyboard, key, str, read) {
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
    child: Center(
      child: TextFormField(
        readOnly: read,
        // controller: key,
        initialValue: str,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.edit),
          hintStyle: GoogleFonts.poppins(
              color: AppColors.textFieldTextColor, fontSize: 15),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        keyboardType: keyboard,
      ),
    ),
  );
}
