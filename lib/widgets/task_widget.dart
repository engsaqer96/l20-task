import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_project/models/task_modle.dart';
import 'package:state_mangment_project/providers/myprovider.dart';

class TaskWedget extends StatelessWidget {
  TaskModel taskModle;
  TaskWedget(this.taskModle);
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, x) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: taskModle.isComplete ? Colors.green : Colors.redAccent),
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
                value: taskModle.isComplete,
                onChanged: (v) {
                  taskModle.isComplete = v;
                  provider.updateTask(taskModle);
                }),
            SizedBox(
              width: 10,
            ),
            Text(taskModle.taskName),
            Spacer(),
            IconButton(
                onPressed: () {
                  provider.deleteTask(taskModle);
                },
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
