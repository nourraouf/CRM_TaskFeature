import 'package:crm_task_feature/Constants.dart';
import 'package:crm_task_feature/providers.dart/tasks.dart';
import 'package:crm_task_feature/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<AllTasks> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final tasksdata = Provider.of<Tasks>(context).tasks;
    return Container(
        color: ColorPalette.backgroundColor,
        child: ListView.builder(
          itemCount: tasksdata.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskItem(
              isDone: tasksdata[index].isDone,
              description: tasksdata[index].description,
            );
          },
        ));
  }
}
