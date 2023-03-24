// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_shopping/forgot_password.dart';
import 'page2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Mate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shopping Mate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool wrongPassword = false;
  String textString = 'a';
  String password = 'password';
  _login() {
    setState(() {
      if (usernameController.text == 'user' &&
          passwordController.text == password) {
        usernameController.clear();
        passwordController.clear();
        wrongPassword = false;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage()));
      } else {
        textString = 'Wrong username or password please try again';
        wrongPassword = true;
      }
    });
  }

  _forgotPasswd() async {
    password = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EmailCheck()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: SizedBox(
                width: 170,
                height: 170,
                child: Image.asset('assets/pngegg.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                'SHOPPING\nMATE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Username',
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: _forgotPasswd,
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Visibility(
              visible: wrongPassword,
              child: Text(
                textString,
                style: const TextStyle(color: Colors.red, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
