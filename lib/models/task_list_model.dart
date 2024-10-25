import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';

class TaskListModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get taskCount => _tasks.length;
  int get doneTaskCount => _tasks.where((task) => task.isDone).length;
  int get pendingTaskCount => taskCount - doneTaskCount;

  Task getTaskAt(int index) {
    return tasks[index];
  }

  void updateTaskDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTaskAt(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeAll() {
    _tasks.clear();
    notifyListeners();
  }
}
