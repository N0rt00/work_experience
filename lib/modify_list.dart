import 'package:flutter/material.dart';

class ModifyPage extends StatefulWidget {
  final List<String> items;
  const ModifyPage({super.key, required this.items});
  @override
  State<ModifyPage> createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ListView(
          children: <Widget>[for (var i in widget.items) Text(i)],
        ),
      ),
    );
  }
}
