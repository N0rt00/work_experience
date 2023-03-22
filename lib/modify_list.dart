import 'package:flutter/material.dart';

class ModifyPage extends StatefulWidget {
  final List<String> items;
  const ModifyPage({super.key, required this.items});
  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  List<String> items = [];

  _pressed(i) {
    setState(() {
      widget.items.remove(i);
    });
  }

  _return() {
    Navigator.pop(context, widget.items);
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
                'MODIFY\nLIST',
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: _return,
              child: const Text('Return'),
            ),
            for (var i in widget.items)
              TextButton(
                onPressed: () {
                  _pressed(i);
                },
                child: Text(
                  i,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              )
          ],
        ),
      ),
    );
  }
}
