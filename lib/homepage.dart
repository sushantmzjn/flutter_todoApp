import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utils/about_button.dart';
import 'package:todo/utils/dialogbox.dart';
import 'package:todo/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // first time opening app default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

//check box tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save a new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          myHintText: 'New Task',
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  // edit Task
  void editTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          myHintText: db.toDoList[index][0],
          onSave: () => saveExistingTask(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // save existing habit
  void saveExistingTask(int index) {
    setState(() {
      db.toDoList[index][0] = _controller.text;
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //about dialog
  void aboutDialoge() {
    showDialog(
        context: context,
        builder: (context) {
          return MyAboutDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6998ab),
      appBar: AppBar(
        title: const Text('TO - DO'),
        centerTitle: true,
        backgroundColor: const Color(0xff06283d),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: aboutDialoge,
            icon: const Icon(Icons.info_outline),
            splashRadius: 25.0,
            splashColor: Colors.green,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Color(0xff06283d),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            editFunction: (context) => editTask(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
