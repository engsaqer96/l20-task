import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:state_mangment_project/models/task_modle.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbhelper = DBHelper._();
  static final String dbName = 'tasks.db';
  static final String tableName = 'tasks';
  static final String idColumn = 'id';
  static final String taskNameColumn = 'taskName';
  static final String isCompleteNameColum = 'isComplete';
  Database dataBase;
  initDataBase() async {
    dataBase = await createConnection();
  }

  Future<Database> createConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Database database = await openDatabase(join(directory.path, dbName),
        version: 1, onCreate: (db, version) {
      db.execute(
          '''CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT , $taskNameColumn TEXT, $isCompleteNameColum INTEGER)''');
    });
    return database;
  }

  Future<List<TaskModel>> getAllTasks() async {
    List<Map<String, dynamic>> results = await dataBase.query(tableName);
    List<TaskModel> tasks = results.map((e) => TaskModel.fromMap(e)).toList();
    return tasks;
  }

  Future<int> createNewTask(TaskModel taskModel) async {
    try {
      int index = await dataBase.insert(tableName, taskModel.toMap());
      return index;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<bool> updateTask(TaskModel taskModel) async {
    try {
      await dataBase.update(tableName, taskModel.toMap(),
          where: '$idColumn=?', whereArgs: [taskModel.id]);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<bool> deleteTask(TaskModel taskModel) async {
    try {
      await dataBase
          .delete(tableName, where: '$idColumn=?', whereArgs: [taskModel.id]);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
