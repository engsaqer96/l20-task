import 'package:flutter/cupertino.dart';
import 'package:state_mangment_project/helpers/db_helper.dart';
import 'package:state_mangment_project/models/task_modle.dart';

class MyProvider extends ChangeNotifier {
  String myName = "Mohammed Saqer";
  List<TaskModel> tasks;
  List<TaskModel> completedTasks;
  List<TaskModel> incompletedTasks;
  MyProvider() {
    getAllTasks();
  }
  changNameVlaue(String name) {
    myName = name;
    notifyListeners();
  }

  getAllTasks() async {
    List<TaskModel> tasks = await DBHelper.dbhelper.getAllTasks();
    this.tasks = tasks;
    completedTasks = tasks.where((element) => element.isComplete).toList();
    incompletedTasks = tasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertNewTask(TaskModel taskModel) async {
    await DBHelper.dbhelper.createNewTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    await DBHelper.dbhelper.updateTask(taskModel);
    getAllTasks();
  }

  deleteTask(TaskModel taskModel) async {
    await DBHelper.dbhelper.deleteTask(taskModel);
    getAllTasks();
  }
}
