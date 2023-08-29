// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/screens/home/graph/graph.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double total = 5764.75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );
          print(result);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, size: 25),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: menuDrawer(context),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: backgroundApp(),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  "R\$ $total",
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Graph(),
        ],
      ),
    );
  }
}
