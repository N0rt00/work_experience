import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController usernameControllerReset = TextEditingController();
  TextEditingController passwordControllerReset = TextEditingController();

  _changePassword() {
    String pass = passwordControllerReset.text;
    Navigator.pop(context, pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              color: const Color.fromARGB(255, 217, 217, 217),
              child: const Text(
                'SHOPPING\nMATE',
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Password Reset',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: TextField(
                  controller: usernameControllerReset..text = 'User',
                  decoration: const InputDecoration(
                      labelText: 'username', border: OutlineInputBorder()),
                  enabled: false,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                  controller: passwordControllerReset,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'New Password',
                      hintText: 'Enter your new password,',
                      border: OutlineInputBorder())),
            ),
            TextButton(
                onPressed: _changePassword,
                child: const Text('Change Password'))
          ],
        ),
      ),
    );
  }
}

class EmailCheck extends StatefulWidget {
  const EmailCheck({super.key});
  @override
  State<EmailCheck> createState() => _EmailCheckState();
}

class _EmailCheckState extends State<EmailCheck> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  bool emailVisable = false;

  _returnToLogin() {
    Navigator.pop(context);
  }

  _submitEmail() {
    setState(() {
      emailVisable = true;
    });
  }

  _checkCode(String text) async {
    if (text == '123456') {
      final result = await Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const ForgotPassword())));
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              color: const Color.fromARGB(255, 217, 217, 217),
              child: const Text(
                'SHOPPING\nMATE',
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: _returnToLogin,
              child: const Text('Return To login'),
            ),
            const Text(
              'RESET PASSWORD',
              style: TextStyle(
                  fontSize: 24,
                  decoration: TextDecoration.underline,
                  letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Please enter your email to reset the password of your account',
                style: TextStyle(fontSize: 15, letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'enter your email',
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            TextButton(
              onPressed: _submitEmail,
              child: const Text('Submit Email'),
            ),
            Visibility(
              visible: emailVisable,
              child: Column(
                children: [
                  Text(
                    'Email sent to ${emailController.text} containing your code',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextField(
                        controller: codeController,
                        onChanged: (value) {
                          _checkCode(value);
                        },
                        decoration: const InputDecoration(
                            labelText: 'Code',
                            hintText: 'Enter the code from your email',
                            border: OutlineInputBorder()),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
