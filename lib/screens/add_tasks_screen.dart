import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_list_model.dart';

import '../models/task.dart';

class AddTasksScreen extends StatelessWidget {
  AddTasksScreen({super.key});
  final TextEditingController _inputController = TextEditingController();

  final UnderlineInputBorder inputBorder =
      const UnderlineInputBorder().copyWith(
    borderSide: BorderSide(
      color: Colors.blue.shade300,
    ),
  );

  final UnderlineInputBorder focusedBorder =
      const UnderlineInputBorder().copyWith(
    borderSide: BorderSide(
      color: Colors.blue.shade300,
      width: 6.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Tasks',
            style: TextStyle(
              color: Colors.blue.shade300,
              fontSize: 32.0,
              fontFamily: 'Arial',
            ),
          ),
          TextField(
            autofocus: true,
            controller: _inputController,
            decoration: InputDecoration(
              enabledBorder: inputBorder,
              focusedBorder: focusedBorder,
              focusColor: Colors.blue.shade300,
            ),
            cursorColor: Colors.blue.shade300,
          ),
          const SizedBox(height: 32.0),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Task newTask = Task(label: _inputController.text);
                    Provider.of<TaskListModel>(context, listen: false)
                        .add(newTask);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.blue.shade300),
                    shape: const WidgetStatePropertyAll(
                      ContinuousRectangleBorder(),
                    ),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.all(16.0),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
