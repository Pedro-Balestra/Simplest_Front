import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget animationLogin() {
  return Container(
    margin: const EdgeInsets.only(
      top: 70,
    ),
    child: Lottie.asset(
      "assets/lottie/Profile1.json",
      width: 193,
      height: 193,
      fit: BoxFit.fill,
    ),
  );
}
