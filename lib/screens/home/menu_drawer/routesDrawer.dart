import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget routesDrawer(label, route, context, icon) {
  return ListTile(
    leading: Icon(icon, color: Colors.black), // Adicione o ícone aqui
    title: Text(
      '$label',
      style: GoogleFonts.poppins(fontSize: 18),
    ),
    onTap: () {
      Navigator.pushNamed(context, route);
    },
  );
}
