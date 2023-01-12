import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/homepage.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Todo(),

  ));
}

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
