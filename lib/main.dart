import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/taskdata.dart';
import 'package:todo_app/screen/taskScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: "ToDo App",
        home: TaskScreen(),
      ),
    );
  }
}
