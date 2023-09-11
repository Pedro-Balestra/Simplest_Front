// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/screens/home/extrato/extract.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

import '../../model/dados.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String nome = "";

  double total = 0.0;
  void calculaTotal() {
    for (var dado in dados) {
      double valor = dado["Valor"];
      total += valor;
    }
  }

  @override
  void initState() {
    super.initState();
    calculaTotal();
    pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    pegarUsuario();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );
          print(result);
        },
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(Icons.add, size: 25),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: menuDrawer(context, nome),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: AppColors.primaryColor,
            child: Center(
              child: Text(
                "R\$ ${total.toStringAsFixed(2)}",
                style: GoogleFonts.poppins(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Extrato(),
        ],
      ),
    );
  }

  pegarUsuario() async {
    User? usuario = auth.currentUser;
    if (usuario != null) {
      setState(() {
        nome = usuario.displayName!;
      });
    }
  }
}
