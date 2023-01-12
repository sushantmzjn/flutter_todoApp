import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box('mybox');

  //run this if this is the 1st time opening app
  void createInitialData() {
    toDoList = [
      ['Workout', false]
    ];
  }

  //load data
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update database
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
