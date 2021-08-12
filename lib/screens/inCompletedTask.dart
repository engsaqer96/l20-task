import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_project/models/task_modle.dart';
import 'package:state_mangment_project/providers/myprovider.dart';
import 'package:state_mangment_project/widgets/task_widget.dart';

class InCompleted_Task_Screen extends StatelessWidget {
  List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return Selector<MyProvider, List<TaskModel>>(builder: (context, data, x) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return TaskWedget(data[index]);
          });
    }, selector: (context, provider) {
      return provider.incompletedTasks;
    });
  }
}
