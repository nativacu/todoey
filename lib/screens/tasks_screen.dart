import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_list_model.dart';
import 'package:todoey/screens/add_tasks_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListModel>(
      builder: (context, taskList, child) => Scaffold(
        backgroundColor: Colors.blue.shade300,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade300,
          onPressed: () => showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTasksScreen(),
            ),
          ),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 45,
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 30.0,
                  right: 30.0,
                  bottom: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        size: 45.0,
                        color: Colors.blue.shade300,
                        weight: 200,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const Text(
                      'Todoey',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontFamily: 'Arial',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${taskList.pendingTaskCount} Task(s) Pending',
                          style: const TextStyle(
                            fontFamily: 'Arial',
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${taskList.doneTaskCount} Task(s) Done',
                          style: const TextStyle(
                            fontFamily: 'Arial',
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: const TasksList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
