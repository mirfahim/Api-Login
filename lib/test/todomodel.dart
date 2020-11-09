import 'package:flutter/cupertino.dart';


import 'taskmodel.dart';

// class TodoModel extends ChangeNotifier{
//   List<TaskModel> taskList = []; //contians all the task
//
//   addTaskInList(){
//     TaskModel taskModel = TaskModel("title ${taskList.length}", "this is the task no detail ${taskList.length}");
//     taskList.add(taskModel);
//
//     notifyListeners();
//     //code to do
//   }
//
// }

class TodoModel extends ChangeNotifier{
  List<TaskModel> tasklist = [];

  addTaskList(){
    TaskModel taskModel = TaskModel("title ${tasklist.length}","this is the task no detail ${tasklist.length}");
    tasklist.add(taskModel);
    notifyListeners();
  }
}