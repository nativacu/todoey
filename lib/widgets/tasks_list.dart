import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_list_model.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListModel>(
      builder: (BuildContext context, TaskListModel taskList, Widget? child) =>
          ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TaskTile(
            task: taskList.getTaskAt(index),
            onChecked: () => taskList.updateTaskDone(index),
            onDelete: () => taskList.removeTaskAt(index),
          );
        },
        itemCount: taskList.taskCount,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      ),
    );
  }
}
