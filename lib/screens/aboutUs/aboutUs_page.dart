import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/screens/aboutUs/aboutUs_widget.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
        decoration: BoxDecoration(
          gradient: backgroundApp(),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(
              "Nosso projeto foi desenvolvido por 3 amigos e programadores, que possuem o mesmo problema: Fazer um controle financeiro adequado ao final do mês, diante esse problema criamos o Simplest para nos auxiliar no controle financeiro.",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                aboutUs(
                    'Pedro Balestra',
                    const NetworkImage(
                        "https://avatars.githubusercontent.com/pedro-balestra"),
                    'https://github.com/pedro-balestra',
                    'https://www.linkedin.com/in/pedro-balestra/',
                    10),
                const SizedBox(
                  height: 20,
                ),
                aboutUs(
                    'Wesley Marcos',
                    const NetworkImage("https://avatars.githubusercontent"
                        ".com/wesley-marcos"),
                    'https://github.com/wesley-marcos',
                    'https://www.linkedin.com/in/wesley-marcos-borges/',
                    10),
                const SizedBox(
                  height: 20,
                ),
                aboutUs(
                    'Thiago Miguel',
                    const NetworkImage(
                        "https://avatars.githubusercontent.com/u/89863394?v=4"),
                    'https://github.com/ThiagoMiguel7',
                    'https://www.linkedin.com/in/thiago-miguel-b706b91a6/',
                    9),
              ],
            ),
          ],
        ),
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
