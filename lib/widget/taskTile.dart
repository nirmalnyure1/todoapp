import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool ischecked;
  final Function checkedBoxCallBack;
  final Function longPressDelete;

  TaskTile(
      {this.ischecked,
      this.taskTitle,
      this.checkedBoxCallBack,
      this.longPressDelete});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressDelete,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: ischecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: ischecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkedBoxCallBack,
      ),
    );
  }
}

//  (bool checkBoxState) {
//           setState(() {
//             ischecked = checkBoxState;
//           });
//         },

// class TaskCheckBox extends StatelessWidget {
//   final bool taskCheckedValue;
//   final Function toogleCheckBoxState;
//   TaskCheckBox({this.taskCheckedValue, this.toogleCheckBoxState});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: taskCheckedValue,
//       activeColor: Colors.lightBlueAccent,
//       onChanged: toogleCheckBoxState,
//     );
//   }
// }
