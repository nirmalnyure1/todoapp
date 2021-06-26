import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  SharedPreferences sharedPreferences;

  List<Task> task = [];
  // List<Task> task = [
  //   // Task(name: 'by water as 3 pm'),
  //   // Task(name: 'by milk '),
  //   // Task(name: 'buy bread'),
  //   // Task(name: 'buy chicken'),`
  //   // Task(name: 'buy egg'),
  // ];

  // TaskData( {this.task});

  // UnmodifiableListView<Task> get taske {
  //   return UnmodifiableListView(task);
  // }

  int get taskCount {
    return task.length;
  }

  void addTask(String taskName) async {
    task.add(Task(name: taskName));
    sharedPreferences = await SharedPreferences.getInstance();
    saveData();
    notifyListeners();
  }

  void deleteTask(Task tasks) {
    // final taskk = Task(name: taskName);
    task.remove(tasks);
    saveData();
    notifyListeners();
  }

  void upDateTask(Task task) {
    task.toggleDone();
    saveData();
    notifyListeners();
  }

  void saveData() async {
    var preference = await SharedPreferences.getInstance();
    List<String> spList =
        task.map((item) => convert.jsonEncode(item.toMap())).toList();
    await preference.setStringList('task', spList);
    // notifyListeners();
    // print(spList);
    print("save data");
  }

  loadData() async {
    var preference = await SharedPreferences.getInstance();
    List<String> spList = preference.getStringList('task');
    print(spList);
    // print(task);
    if (spList != null) {
      task = spList
              .map((item) => Task.formMap(convert.jsonDecode(item)))
              .toList() ??
          0;
    }
    //notifyListeners();

    print(task);
    // print(task[0]);
  }
}
