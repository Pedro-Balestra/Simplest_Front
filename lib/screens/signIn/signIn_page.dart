import 'package:flutter/material.dart';
import 'package:simples_front_end/utils/appColors.dart';
import 'package:simples_front_end/utils/widgetButton.dart';
import 'package:simples_front_end/utils/widgetTextfield.dart';

import 'animation_login.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              animationSignIn(),
              const SizedBox(
                height: 40,
              ),
              textFieldContainer("Nome Completo", TextInputType.name, false),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer("Email", TextInputType.emailAddress, false),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer("Telefone", TextInputType.phone, false),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer("Senha", TextInputType.visiblePassword, true),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer(
                  "Confirmar Senha", TextInputType.visiblePassword, true),
              const SizedBox(
                height: 20,
              ),
              button("Cadastrar", context, 'login'),
            ],
          ),
        ),
      ),
    );
  }
}
