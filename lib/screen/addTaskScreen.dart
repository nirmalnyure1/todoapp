import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/models/taskdata.dart';

class AddTaskScreen extends StatelessWidget {
  // AddTaskScreen({this.addFunction, this.textFieldText});

  // final Function addFunction;
  // final Function textFieldText;

  @override
  Widget build(BuildContext context) {
    String valueOfTextField;
    final controllerTextField = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                TextField(
                  controller: controllerTextField,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    valueOfTextField = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: () {
                    //  valueOfTextField = controllerTextField.text;
                    if (valueOfTextField != null && valueOfTextField != '') {
                      // print(valueOfTextField);
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(valueOfTextField);
                      // TaskData().addTask(valueOfTextField);
                      Navigator.pop(context);
                      print(valueOfTextField);
                    } else {
                      //Navigator.pop(context);
                    }
                    print('hello');
                    print(valueOfTextField);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
