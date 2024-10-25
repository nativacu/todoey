import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.task,
      required this.onChecked,
      required this.onDelete});

  final Task task;
  final Function onChecked;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      key: ValueKey(task.label),
      onDismissed: (direction) {
        onDelete();
      },
      child: CheckboxListTile(
        activeColor: Colors.blue.shade200,
        side: const BorderSide(color: Colors.blue),
        title: Text(
          task.label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        value: task.isDone,
        onChanged: (val) => onChecked(),
      ),
    );
  }
}
