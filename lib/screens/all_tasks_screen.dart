import 'package:crm_task_feature/Constants.dart';

import 'package:crm_task_feature/screens/add_new_task.dart';
import 'package:crm_task_feature/widgets/Navigation_bar.dart';
import 'package:crm_task_feature/widgets/custom_appbar.dart';
import 'package:crm_task_feature/widgets/task_card.dart';
import 'package:crm_task_feature/widgets/task_tabs.dart';
import 'package:flutter/material.dart';

class AllTasksScreen extends StatefulWidget {
  @override
  _AllTasksScreenState createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: customAppBar(height, "All tasks", Icon(Icons.search),
          Icon(Icons.add_circle_outline), () {}, () {
        Navigator.of(context).pushNamed(AddTask.routeName);
      }),
      body: ListView(
        children: <Widget>[
          Container(
            height: height * 0.25,
            margin: EdgeInsets.all(10),
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TaskCard(
                  taskCategory: "All tasks",
                  imagePath: 'assets/images/1.png',
                  numOfTasks: 298,
                  softBackground: Color(0xff9698D6).withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TaskCard(
                  taskCategory: "Pending",
                  imagePath: 'assets/images/2.png',
                  numOfTasks: 84,
                  softBackground: Color(0xffF4BE5E).withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TaskCard(
                  taskCategory: "Completed",
                  imagePath: 'assets/images/3.png',
                  numOfTasks: 214,
                  softBackground: Color(0xffFF808B).withOpacity(0.2),
                ),
              ),
            ]),
          ),
          Container(height: height * 0.55, child: TaskTabs()),
        ],
        //tabs
      ),
      bottomNavigationBar: ExtractedNavigationBar(),
    );
  }
}
