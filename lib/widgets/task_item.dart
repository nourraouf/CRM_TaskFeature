import 'dart:ui';

import 'package:crm_task_feature/Constants.dart';
import 'package:crm_task_feature/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final bool isDone;
  final String description;

  const TaskItem({Key key, @required this.isDone, @required this.description})
      : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorPalette.solidWhite),
        child: ListTile(
          leading: CustomCheckbox(
            isChecked: widget.isDone,
          ),
          trailing: Image.asset(
            'assets/images/Assigned.png',
            //  fit: BoxFit.cover,
          ),
          title: Text(
            widget.description,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff1C1D21),
            ),
          ),
        ),
      ),
    );
  }
}
