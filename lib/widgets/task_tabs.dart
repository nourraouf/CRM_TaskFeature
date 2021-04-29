import 'package:crm_task_feature/Constants.dart';
import 'package:crm_task_feature/screens/done_tasks.dart';
import 'package:crm_task_feature/screens/not_implemented.dart';
import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class TaskTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        appBar: TabBar(
          unselectedLabelStyle: Styles.greyText,
          unselectedLabelColor: ColorPalette.secondaryColor,
          labelColor: ColorPalette.solidgrey,
          labelStyle: Styles.blackText2,
          // indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Color(0xFFFFFFFF)),
          tabs: [
            Tab(
              child: const Text(
                "All",
                //style: Styles.blackText,
              ),
            ),
            Tab(
              child: const Text(
                "Done",
                //  style: Styles.blackText,
              ),
            ),
            Tab(
              child: const Text(
                "pending",
                // style: Styles.blackText,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: <Widget>[
              AllTasks(),
              NotImplemented(),
              NotImplemented(),
            ],
          ),
        ),
      ),
    );
  }
}
