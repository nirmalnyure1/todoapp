import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/taskdata.dart';
import 'package:todo_app/widget/taskTile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // List<Task> task = List<Task>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      TaskData().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    //here taskData work as TaskData
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
          itemCount: taskData.taskCount,
          //  itemCount: widget.task.length,
          itemBuilder: (context, index) {
            final task = taskData.task[index];
            var taskTile = TaskTile(
              longPressDelete: () {
                taskData.deleteTask(task);
              },
              taskTitle: task.name,
              ischecked: task.isDone,
              checkedBoxCallBack: (checkboxState) {
                taskData.upDateTask(task);

                //replacement due to the consument widget used above
                // Provider.of<TaskData>(context, listen: false)
                //     .task[index]
                //     .toggleDone();
              },
            );
            return taskTile;
          });
    });
  }
}

//  checkedBoxCallBack: (value) {
//               setState(() {
//                 task[index].toggleDone();
//               });
//             },

//by the use of consumer
//we replece below Provider.of() code with the taskData
//  Provider.of<TaskData>(context, listen: false)
//                     .upDateTask(taskData.task[index]);
