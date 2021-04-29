import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants.dart';
import 'custom_checkbox.dart';

class TypeNewTask extends StatelessWidget {
  const TypeNewTask({
    Key key,
    @required this.f,
  }) : super(key: key);

  final DateFormat f;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: const Text(
          "Type your task",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff1C1D21),
          ),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: <Widget>[
            Text(
              "Task created on ",
              style: Styles.greyText,
            ),
            Text(
              f.format(DateTime.now()),
              style: Styles.greyText,
            )
          ],
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CustomCheckbox(
          isChecked: false,
        ),
      ),
    );
  }
}
