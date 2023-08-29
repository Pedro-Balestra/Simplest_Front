import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simples_front_end/screens/home/home.dart';
import 'package:simples_front_end/screens/login/login_page.dart';
import 'screens/signUp/signUp_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'home',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'signUp': (BuildContext context) => const SignUpPage(),
        'home': (BuildContext context) => const Home(),
      },
    );
  }
}
