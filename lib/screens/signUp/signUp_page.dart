import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simples_front_end/model/users.dart';
import 'package:simples_front_end/utils/appColors.dart';
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
  TextEditingController confirmarSenhaController = TextEditingController();

  String msgErro = "";
  void validaCampos() async {
    // 1 Passo - Recuperar os dados
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text.trim();
    String confirmarSenha = confirmarSenhaController.text.trim();

    print("Senha: '$senha'");
    print("Confirmar Senha: '$confirmarSenha'");

    // 2 Passo - Validar os dados
    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length >= 6) {
          if (senha == confirmarSenha) {
            // Cadastre no banco de dados

            // 1 Pass - receber os dados da interface em um objeto model
            Users user = Users();

            user.nome = nome;
            user.senha = senha;
            user.email = email;

            try {
              // 2 Passo - Executar o método cadastrarUsuario(user)
              cadastrarUsuario(user);

              setState(() {
                msgErro = "";
              });
            } catch (erro) {
              setState(() {
                msgErro = "Não foi possivel cadastrar";
              });
            }
          } else {
            setState(() {
              msgErro = "As senhas não coincidem!";
            });
          }
        } else {
          setState(() {
            msgErro = "Preencha a senha com pelo menos 6 caracteres!";
          });
        }
      }
    } else {
      setState(() {
        msgErro = "Preencha o campo nome!";
      });
    }
  }

//Metodo que cadastra no Firebase o usuário
  void cadastrarUsuario(user) async {
    // 1 Passo - instanciar o Firebase
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.senha,
      );

      // Navegar para a próxima tela apenas se o cadastro for bem-sucedido
      Navigator.pushNamed(context, 'login');

      // Exibir a mensagem de sucesso aqui
      const SnackBar snackBar = SnackBar(
        content: Text("Cadastrado com sucesso"),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (erro) {
      setState(() {
        msgErro = "Não foi possível cadastrar";
      });
    }
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
              textFieldContainer(
                  "Confirmar Senha",
                  TextInputType.visiblePassword,
                  true,
                  confirmarSenhaController),
              const SizedBox(
                height: 20,
              ),
              buttonCadastrar("Cadastrar", context, validaCampos),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonCadastrar(label, context, Function() function) {
    return Container(
      height: 40,
      width: 210,
      child: ElevatedButton(
        onPressed: () {
          // Chame a função de validação primeiro
          function();

          // Verifique se há uma mensagem de erro e exiba-a se necessário
          if (msgErro.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msgErro),
                duration: Duration(seconds: 5),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          foregroundColor: AppColors.buttonText,
          textStyle: GoogleFonts.poppins(fontSize: 15),
        ),
        child: Text("$label"),
      ),
    );
  }
}
