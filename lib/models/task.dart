import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  String name;
  bool isDone;
  //String hello = 'k xa vai tero kbr';

  Task({this.name, this.isDone = false});

  Task.formMap(Map map)
      : this.name = map['name'],
        this.isDone = map['isDone'];

  Map toMap() {
    return {'name': this.name, 'isDone': this.isDone};
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
