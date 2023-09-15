import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget routesDrawer(label, route, context, icon, funcao) {
  return ListTile(
    leading: Icon(icon, color: Colors.black), // Adicione o ícone aqui
    title: Text(
      '$label',
      style: GoogleFonts.poppins(fontSize: 18),
    ),
    onTap: () {
      if (funcao) {
        signOut();
      }
      Navigator.pushNamed(context, route);
    },
  );
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    print("Saiu");
  } catch (e) {
    print("Erro ao fazer logoff: $e");
  }
}
