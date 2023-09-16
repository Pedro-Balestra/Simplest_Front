import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/screens/profile/photo_profile.dart';
import 'package:simples_front_end/utils/appColors.dart';

import '../../utils/widgetButton.dart';
import '../../utils/widgetTextButton.dart';
import '../../utils/widgetTextfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  String nome = '';
  String telefone = '';
  String email = '';
  String senha = '';

  FirebaseAuth auth = FirebaseAuth.instance;

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
        child: Column(
          children: [
            photoProfile(),
            textFieldProfile(TextInputType.name, nomeController, nome, true),
            const SizedBox(
              height: 20,
            ),
            textFieldProfile(
                TextInputType.emailAddress, emailController, email, true),
            const SizedBox(
              height: 20,
            ),
            textFieldProfile(TextInputType.phone, null, telefone, true),
            const SizedBox(
              height: 20,
            ),
            wtextButton("Trocar senha"),
            const SizedBox(
              height: 30,
            ),
            button("salvar", context, 'home', salvar)
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
        telefone = "00000000";
        email = usuario.email!;
      });
    }
  }

  salvar() {}
}
