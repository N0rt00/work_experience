// ignore_for_file: avoid_print

import 'modify_list.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> items = [];
  TextEditingController itemController = TextEditingController();

  _modifyList() async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ModifyPage(items: items)));
    setState(() {
      items = result;
    });
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            items = [];
                          });
                        },
                        child: const Text('Clear List')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Log Out')),
                    TextButton(
                        onPressed: _modifyList,
                        child: const Text('Modify List'))
                  ],
                ),
              ),
            ),
            for (var i in items) Checkbox(foodName: i),
            Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        items.add(itemController.text);
                        itemController.clear();
                      });
                    },
                    child: const Icon(Icons.add)),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: itemController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Item',
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Checkbox extends StatefulWidget {
  final String foodName;
  const Checkbox({super.key, required this.foodName});
  final checkedValue = false;
  @override
  State<Checkbox> createState() => CheckboxState();
}

class CheckboxState extends State<Checkbox> {
  bool checkedValue = false;
  Map<String, bool> values = {
    'Text(widget.foodName, style: TextStyle(color: Colors.deepPurple)': true,
    'Text(widget.foodName, style: TextStyle(color: Colors.lightBlue)': false,
  };

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: checkedValue
          ? Text(widget.foodName,
              style: const TextStyle(decoration: TextDecoration.lineThrough))
          : Text(widget.foodName),
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
