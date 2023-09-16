import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget animationGears() {
  return Container(
    margin: const EdgeInsets.only(
      top: 70,
    ),
    child: Lottie.asset(
      "assets/lottie/gears1.json",
      width: 193,
      height: 193,
      fit: BoxFit.fill,
    ),
  );
}
