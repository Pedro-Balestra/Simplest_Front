import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simples_front_end/screens/home/menu_drawer/routesDrawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

Widget menuDrawer(context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          color: AppColors.primaryColor,
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 52),
                  height: 200,
                  width: 200,
                  child: Lottie.asset('assets/lottie/profile_hello.json'),
                ),
                // const SizedBox(height: 18),
                Text(
                  'Olá, user',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        routesDrawer('Home', 'home', context, Icons.home),
        routesDrawer('Histórico', 'login', context, Icons.description),
        routesDrawer('Perfil', 'login', context, Icons.person),
        routesDrawer('Sobre Nós', 'login', context, Icons.info_rounded),
        routesDrawer('Sair', 'login', context, Icons.arrow_circle_left),
      ],
    ),
  );
}
