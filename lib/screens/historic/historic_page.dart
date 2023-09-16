import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

import '../../utils/widgetButton.dart';
import 'animation_gears.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String nome = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: menuDrawer(context, nome),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: backgroundApp(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              animationGears(),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: Colors.white, // Cor do container branco
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Cor da sombra
                        spreadRadius: 5, // Raio de espalhamento
                        blurRadius: 10, // Raio de desfoque
                        offset: const Offset(0, 3), // Deslocamento da sombra
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          "Desculpe!!!",
                          style: GoogleFonts.poppins(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Ainda estamos desenvolvendo esta tela!!",
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              button("Voltar", context, 'home', () {}),
            ],
          ),
        ),
      ),
    );
  }

  pegarUsuario() async {
    User? usuario = await auth.currentUser;
    if (usuario != null) {
      setState(() {
        nome = usuario.displayName!;
      });
    }
  }
}
