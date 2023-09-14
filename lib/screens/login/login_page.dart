import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool obscurePassword = true;

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
              textFieldContainer(
                  "Email", TextInputType.emailAddress, emailController),
              const SizedBox(
                height: 22,
              ),
              textFieldContainerObscure("Senha", TextInputType.visiblePassword,
                  obscurePassword, senhaController),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: wtextButton("Esqueceu a senha?"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              button("Entrar", context, 'login', login),
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
                  onPressed: () {
                    Navigator.pushNamed(context, 'signUp');
                  },
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

  login() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: senhaController.text);
      if (userCredential.user != null) {
        Navigator.pushNamed(context, 'home');
        print('sucess');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário não encotrado'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sua senha esta errada'),
          ),
        );
      }
    }
  }

  Widget textFieldContainerObscure(label, keyboard, obscure, key) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 60,
      child: TextField(
        obscureText: obscure,
        controller: key,
        decoration: InputDecoration(
          labelText: "$label:",
          hintStyle: GoogleFonts.poppins(
            color: AppColors.textFieldTextColor,
            fontSize: 15,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 34,
            top: 5,
          ),
          // Adicione um ícone para alternar a visibilidade da senha
          suffixIcon: obscure
              ? IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
        ),
        keyboardType: keyboard,
      ),
    );
  }
}
