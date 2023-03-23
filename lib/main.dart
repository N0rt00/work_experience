// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'page2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var colour = Colors.red;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _login() {
    setState(() {
      if (usernameController.text == 'user' &&
          passwordController.text == 'password') {
        print('right');
        usernameController.clear();
        passwordController.clear();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage()));
      } else {
        print('wrong');
      }
    });
  }

  _forgotPasswd() {}

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
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: _login,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: colour),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
