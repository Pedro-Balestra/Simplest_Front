import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/utils/appColors.dart';

Widget button(label, context, route) {
  return Container(
    height: 40,
    width: 210,
    child: ElevatedButton(
      onPressed: () {
        Navigator.popAndPushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.button,
        foregroundColor: AppColors.buttonText,
        textStyle: GoogleFonts.poppins(fontSize: 15),
      ),
      child: Text("$label"),
    ),
  );
}
