// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:simples_front_end/screens/home/menu_drawer/drawer.dart';
import 'package:simples_front_end/utils/appColors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // FilePickerResult? result;
  // String? _fileText;
  // PlatformFile? pickedFile;
  // bool isLoading = false;
  // File? fileToDisplay;

  // void pickFile() async {
  //   try {
  //     // Verificar e solicitar a permissão de leitura externa
  //     var status = await Permission.storage.status;
  //     if (!status.isGranted) {
  //       await Permission.storage.request();
  //       status = await Permission.storage.status;
  //       if (!status.isGranted) {
  //         print("Permission denied");
  //         return;
  //       }
  //     }

  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['pdf'],
  //     );

  //     if (result == null) return;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );
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
                  "R 2362.60",
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Lottie.asset('assets/lottie/profile_hello.json'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
