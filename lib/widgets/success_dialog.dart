import 'package:crm_task_feature/widgets/task-tile.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class SuccessDialog extends StatelessWidget {
  final String taskTitle;

  final String description;
  final String taskDate;
  final String filename;
  final String assignedTo;

  const SuccessDialog({
    Key key,
    @required this.taskTitle,
    @required this.description,
    @required this.assignedTo,
    @required this.filename,
    this.taskDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(taskTitle);
    print(description);
    return ListView(
      children: <Widget>[
        TaskTile(
          icon: Icon(
            Icons.title_rounded,
            color: ColorPalette.primaryColor,
          ),
          tasktitle: "Title",
          tasksubtitle: taskTitle.toString(),
        ),
        TaskTile(
          icon: Icon(
            Icons.person,
            color: ColorPalette.primaryColor,
          ),
          tasktitle: "Assigned to",
          tasksubtitle: assignedTo,
        ),
        TaskTile(
          icon: Icon(
            Icons.calendar_today,
            color: ColorPalette.primaryColor,
          ),
          tasktitle: "Due date",
          tasksubtitle: taskDate,
        ),
        TaskTile(
          icon: Icon(
            Icons.description,
            color: ColorPalette.primaryColor,
          ),
          tasktitle: "Description",
          tasksubtitle: description.toString(),
        ),
        TaskTile(
          icon: Icon(
            Icons.add_comment_outlined,
            color: ColorPalette.primaryColor,
          ),
          tasktitle: "Attachments",
          tasksubtitle: filename != null ? filename : "No attachments added",
        ),
      ],
    );
  }
}
