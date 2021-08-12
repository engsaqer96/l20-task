import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_project/helpers/db_helper.dart';
import 'package:state_mangment_project/models/task_modle.dart';
import 'package:state_mangment_project/providers/myprovider.dart';
import 'package:state_mangment_project/screens/allTask.dart';
import 'package:state_mangment_project/screens/completedTask.dart';
import 'package:state_mangment_project/screens/inCompletedTask.dart';
import 'package:state_mangment_project/screens/newTask.dart';

class HomePage extends StatelessWidget {
  List<TaskModel> tasks;

  // insertNewTask(TaskModel taskModel) async {
  //   await DBHelper.dbhelper.createNewTask(taskModel);
  //   getAllTasks();
  // }

  // getAllTasks() async {
  //   List<TaskModel> tasks = await DBHelper.dbhelper.getAllTasks();
  //   this.tasks = tasks;

  // }

  // updateTask(TaskModel taskModel) async {
  //   await DBHelper.dbhelper.updateTask(taskModel);
  //   getAllTasks();
  // }

  // deleteTask(TaskModel taskModel) async {
  //   await DBHelper.dbhelper.deleteTask(taskModel);
  //   getAllTasks();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(seconds: 1)).then((value) => getAllTasks());
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("ToDoApp"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NewTaskScreen();
                      }));
                    },
                    icon: Icon(Icons.add))
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "All Task",
                  ),
                  Tab(
                    text: "Completed Task",
                  ),
                  Tab(
                    text: "InCompeleted Task",
                  )
                ],
              ),
            ),
            body: Selector<MyProvider, List<TaskModel>>(
              selector: (context, provider) => provider.tasks,
              builder: (context, data, x) => data == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      children: [
                        All_Task_Screen(),
                        Completed_Task_Screen(),
                        InCompleted_Task_Screen()
                      ],
                    )
              //     Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     Text(
              //       Provider.of<MyProvider>(context).myName,
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 25),
              //     ),
              //     ElevatedButton(
              //       child: Text("change"),
              //       onPressed: () {
              //         print(Provider.of<MyProvider>(context, listen: false)
              //             .changNameVlaue('Ahmed'));
              //       },
              //     ),
              //   ],
              // ));
              ,
            )));
  }
}
