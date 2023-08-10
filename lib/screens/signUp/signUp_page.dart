import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/model/users.dart';
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

  String msgErro = "";

  void validaCampos() {
    //1 Passo - Recuperar os dados
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    //2 Passo - Validar os dados
    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length < 6) {
          msgErro = "Preencha a senha com mais de 6 caracteres!";
        } else {
          //Cadastre no banco de dados

          //1 Pass - recber os dados da interface em um objeto model
          Users user = new Users();

          user.nome = nome;
          user.senha = senha;
          user.email = email;

          //2 Passo - Executar o metodo cadastrarUsuario(user)
          cadastrarUsuario(user);
        }
      }
    } else {
      msgErro = "Preencha o campo nome!";
    }
  }

  //Metodo que cadastra no Firebase o usuário
  void cadastrarUsuario(user) async {
    //1 Passo - instarciar o firebase
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(email: user.email, password: user.senha)
        .then(
      (firebaseUser) {
        const SnackBar snackBar = SnackBar(
          content: Text("Cadastrado com sucesso"),
          duration: Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    ).catchError(
      (erro) {
        print(
          "Aconteceu o erro: " + erro.toString(),
        );
      },
    );
  }

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
              // Container(
              //   height: 40,
              //   width: 210,
              //   child: ElevatedButton(
              //     onPressed: validaCampos,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColors.button,
              //       foregroundColor: AppColors.buttonText,
              //       textStyle: GoogleFonts.poppins(fontSize: 15),
              //     ),
              //     child: Text("cadastrar"),
              //   ),
              // )

              button("Cadastrar", context, 'login', validaCampos),
            ],
          ),
        ),
      ),
    );
  }
}
