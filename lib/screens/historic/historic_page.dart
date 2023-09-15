import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

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
