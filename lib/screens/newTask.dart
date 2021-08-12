import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_project/models/task_modle.dart';
import 'package:state_mangment_project/providers/myprovider.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isComplete = false;
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddNewTask'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Insert New Task',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (v) {
                this.taskName = v;
              },
              decoration: InputDecoration(
                  labelText: 'Task Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Is Complete',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 30,
                ),
                Checkbox(
                    checkColor: Colors.blueAccent,
                    value: isComplete,
                    onChanged: (v) {
                      this.isComplete = v;
                      setState(() {});
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<MyProvider>(
                builder: (context, provider, x) => ElevatedButton(
                      onPressed: () {
                        provider.insertNewTask(TaskModel(
                            taskName: taskName, isComplete: isComplete));
                        Navigator.pop(context);
                      },
                      child: Text('Insert New Task'),
                    ))
          ],
        ),
      ),
    );
  }
}
