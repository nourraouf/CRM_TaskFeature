import 'package:flutter/cupertino.dart';
import 'package:crm_task_feature/models/task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasksList = [
    Task(
        assignedTo: 'Ahmed',
        description: 'Design new dashboard',
        endDate: DateTime.now(),
        startDate: DateTime.now(),
        tag: '',
        isDone: true),
    Task(
      assignedTo: 'Mariam',
      description: 'Search for a UI kit',
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      tag: '',
      isDone: true,
    ),
    Task(
        assignedTo: 'Mariam',
        description: 'Design new dashboard',
        endDate: DateTime.now(),
        startDate: DateTime.now(),
        tag: '',
        isDone: true),
    Task(
      assignedTo: 'Mariam',
      description: 'Design search page',
      endDate: DateTime.now(),
      startDate: DateTime.now(),
      tag: '',
    ),
  ];
  List<Task> get tasks {
    if (_tasksList.isEmpty) {
      return [];
    }
    return [..._tasksList];
  }

  void addTask(Task newTask) {
    _tasksList.add(newTask);
    notifyListeners();
  }
}
