// ignore_for_file: avoid_print

import 'modify_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> items = [];
  int uniqueID = 0;
  TextEditingController itemController = TextEditingController();

  _modifyList() async {
    Map<List<dynamic>, bool> dataPassthrough =
        Provider.of<MyData>(context, listen: false).myVariable;
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ModifyPage(items: dataPassthrough)));
    setState(() {
      Provider.of<MyData>(context, listen: false).setMyVariable(result);
    });
  }

  _itemAdd() {
    Map<List<dynamic>, bool> dataVar =
        Provider.of<MyData>(context, listen: false).myVariable;
    return setState(() {
      //items.add('${itemController.text}.$uniqueID');
      var temp = [itemController.text, UniqueKey()];
      dataVar[temp] = false;
      itemController.clear();
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
                            Provider.of<MyData>(context, listen: false)
                                .setMyVariable({});
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
            for (final i in Provider.of<MyData>(context).myVariable.entries)
              CheckboxC(
                foodList: i.key,
                boolVal: i.value,
              ),
            Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      _itemAdd();
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
            const MyOtherWidget()
          ],
        ),
      ),
    );
  }
}

class CheckboxC extends StatefulWidget {
  final List<dynamic> foodList;
  final bool boolVal;
  const CheckboxC({super.key, required this.foodList, required this.boolVal});
  final checkedValue = false;
  @override
  State<CheckboxC> createState() => CheckboxState();
}

class CheckboxState extends State<CheckboxC> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            checkedValue = !checkedValue;
          });
          Map<List<dynamic>, bool> myDataVar =
              Provider.of<MyData>(context, listen: false).myVariable;
          myDataVar[widget.foodList] = checkedValue;
          Provider.of<MyData>(context, listen: false).setMyVariable(myDataVar);
          print(myDataVar);
        },
        splashFactory: NoSplash.splashFactory,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 12),
              child: Text(
                widget.foodList[0],
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    decoration: widget.boolVal
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyData extends ChangeNotifier {
  Map<List<dynamic>, bool> _myVariable = {};

  Map<List<dynamic>, bool> get myVariable => _myVariable;

  void setMyVariable(Map<List<dynamic>, bool> newValue) {
    _myVariable = newValue;
    notifyListeners();
  }
}

class MyOtherWidget extends StatelessWidget {
  const MyOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<List<dynamic>, bool> myVariable =
        Provider.of<MyData>(context).myVariable;
    print(myVariable);
    return Container();
  }
}
