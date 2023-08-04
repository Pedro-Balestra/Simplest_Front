import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/screens/login/animation_login.dart';
import 'package:simples_front_end/utils/widgetButton.dart';
import 'package:simples_front_end/utils/widgetTextButton.dart';
import 'package:simples_front_end/utils/widgetTextfield.dart';

import '../../utils/appColors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: backgroundApp(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              animationLogin(),
              const SizedBox(
                height: 99,
              ),
              textFieldContainer("Email", TextInputType.emailAddress, false),
              const SizedBox(
                height: 22,
              ),
              textFieldContainer("Senha", TextInputType.visiblePassword, true),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: wtextButton(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              button("Entrar"),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "ou",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/Icons/gmail.png"),
                  Image.asset("assets/Icons/Facebook.png"),
                  Image.asset("assets/Icons/Instagram.png"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Não tem uma Conta?',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: AppColors.buttonText),
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' Clique aqui',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
