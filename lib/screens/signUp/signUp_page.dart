import 'package:flutter/material.dart';
import 'package:simples_front_end/utils/appColors.dart';
import 'package:simples_front_end/utils/widgetButton.dart';
import 'package:simples_front_end/utils/widgetTextfield.dart';

import 'animation_signUp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

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
              animationSignUp(),
              const SizedBox(
                height: 40,
              ),
              textFieldContainer(
                  "Nome Completo", TextInputType.name, false, nomeController),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer(
                  "Email", TextInputType.emailAddress, false, emailController),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer("Telefone", TextInputType.phone, false, null),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer("Senha", TextInputType.visiblePassword, true,
                  senhaController),
              const SizedBox(
                height: 20,
              ),
              textFieldContainer("Confirmar Senha",
                  TextInputType.visiblePassword, true, senhaController),
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
