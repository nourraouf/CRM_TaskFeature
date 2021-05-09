import 'package:flutter/material.dart';

import '../Constants.dart';

class TaskTile extends StatelessWidget {
  final Icon icon;
  final String tasktitle, tasksubtitle;

  const TaskTile({Key key, this.icon, this.tasktitle, this.tasksubtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(tasktitle);
    print(tasksubtitle);

    return ListTile(
      title: Text(
        tasktitle,
        style: Styles.blackText2,
      ),
      subtitle: Text(
        tasksubtitle,
        style: Styles.greyText2,
      ),
      leading: icon,
    );
  }
}
