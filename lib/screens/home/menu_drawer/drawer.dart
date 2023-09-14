import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simples_front_end/screens/home/menu_drawer/routesDrawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

Widget menuDrawer(context, nome) {
  return Drawer(
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 270,
          color: AppColors.primaryColor,
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  height: 200,
                  width: 200,
                  child: Lottie.asset('assets/lottie/profile_hello.json'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      'Olá, $nome',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        routesDrawer('Home', 'home', context, Icons.home),
        routesDrawer('Histórico', 'login', context, Icons.description),
        routesDrawer('Perfil', 'profile', context, Icons.person),
        routesDrawer('Sobre Nós', 'login', context, Icons.info_rounded),
        routesDrawer('Sair', 'login', context, Icons.arrow_circle_left),
      ],
    ),
  );
}
