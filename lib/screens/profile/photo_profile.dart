import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget photoProfile() {
  return Container(
    margin: const EdgeInsets.only(
      top: 70,
    ),
    child: Lottie.asset(
      "assets/lottie/profile_hello.json",
      width: 300,
      height: 300,
      fit: BoxFit.fill,
    ),
  );
}
